# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=bikeshed-git
pkgver=2.2.3.3886cea8b
pkgrel=1
pkgdesc='A preprocessor for anyone writing specifications.'
arch=('any')
url="https://tabatkins.github.io/bikeshed/"
license=('custom:CC0')
depends=('python'
         'python-aiofiles' 'python-aiohttp' 'python-attrs' 'python-certifi'
         'python-cssselect' 'python-html5lib' 'python-isodate' 'python-json_home_client'
         'python-lxml' 'python-pygments' 'python-requests' 'python-result'
         'python-tenacity' 'python-widlparser')
makedepends=('git' 'python-setuptools')
source=("bikeshed::git+https://github.com/tabatkins/bikeshed.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "bikeshed"

  printf "%s.%s" "$(cat semver.txt)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "bikeshed"

  python setup.py build
}

package() {
  cd "bikeshed"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
