# Maintainer: Campbell (NinjaCheetah) <ninjacheetah@ncxprogramming.com>

pkgname=wiipy
pkgver=1.0.0
pkgrel=1
pkgdesc='Command line tool to manage file formats used on the Wii'
arch=('x86_64')
url='https://github.com/NinjaCheetah/WiiPy'
license=('MIT')
depends=('python>=3.11.0' 'expat' 'openssl>=3.3.0')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NinjaCheetah/WiiPy/archive/v${pkgver}.tar.gz")
sha256sums=('55b38ace5741d8c44f8aed20c3e700ceffab39b0e7b68f12e116570700168018')

build() {
  cd WiiPy-${pkgver}
  python -m venv .venv
  ./.venv/bin/pip install -r requirements.txt

  ./.venv/bin/python -m nuitka --show-progress --assume-yes-for-downloads --follow-imports wiipy.py
}

package() {
  cd WiiPy-${pkgver}
  install -Dm755 wiipy.bin "$pkgdir/usr/bin/wiipy"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
