# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=workstation-git
pkgver=r9.367a6bb
pkgrel=1
pkgdesc='A nifty commandline tool to manage your workstation'
arch=('i686' 'x86_64')
url='https://github.com/amar-laksh/workstation'
license=('GPL-2.0')
provides=('workstation')
depends=('libnotify' 'notify-osd')
makedepends=('cargo' 'opencv2')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/workstation"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd workstation
  cargo build --release
}

package() {
  cd workstation
  install -Dm755 target/release/workstation "${pkgdir}/opt/workstation/workstation"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/workstation/LICENSE"
  install -Dm644 haarcascade_frontalface_alt.xml -t "${pkgdir}/opt/workstation/"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/workstation/workstation "${pkgdir}/usr/bin/workstation"
}