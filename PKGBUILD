# Maintainer: Hao Long <aur@esd.cc>

pkgname=archivebox
pkgver=0.6.2
pkgrel=1
pkgdesc="The open source self-hosted web archive"
arch=("any")
url="https://github.com/pirate/ArchiveBox"
license=('MIT')
provides=('archivebox')
conflicts=('archivebox')
depends=('python-django' 'python-mypy_extensions' 'wget'
         'python-crontab' 'python-atomicwrites' 'python-dateparser'
         'python-requests' 'python-base32_crockford' 'python-w3lib'
         'chromium' 'python-django-extensions' 'git'
         'youtube-dl' 'curl' 'single-file-git'
         'readability-extractor' 'ripgrep' 'mercury-parser')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cc7b72ee54eb6bac9a6fd774ab712ab0f1b717e96b9d92fa3e34006cbd40d8d6')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 archivebox/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
