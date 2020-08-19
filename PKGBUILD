# Maintainer: Hao Long <aur@esd.cc>

pkgname=archivebox
pkgver=0.4.21
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
         'readability-extractor')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ae6bbd2a63dedec4b55eac3418440c2e50a11e16e18b28e4c7cd46332d679e47')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 archivebox/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
