# Maintainer: A. Karmanov <a.karmanov@inventati.org>

pkgname=gixy-next
pkgver=0.1.4
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url='https://gixy.io'
license=('MPL-2.0')
depends=(
  'crossplane'
  'python-configargparse'
  'python-jinja'
  'python-tldextract'
)
optdepends=(
  'python-requests: ReDoS checks via external API'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
conflicts=('gixy' 'gixy-git' 'gixy-ng' 'gixy-ng-git')
_srcname="gixy_next-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/g/${pkgname}/${_srcname}.tar.gz")
b2sums=('2f2e1ae8933604d528501728fdd6bd355498f1fd6b3d6fc466b3795ce1c61ad707fc0dab0d20bf4f69365fa128358f30ee8a3e16ef2522dbcb62999988445d4b')

build() {
  cd "$_srcname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_srcname"
  pytest
}

package() {
  cd "$_srcname"
  python -m installer --destdir="$pkgdir" "dist/${_srcname}-py3-none-any.whl"
}
