# Maintainer: A. Karmanov <a.karmanov@inventati.org>

pkgname=gixy-next
pkgver=0.1.2
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
b2sums=('75ca5bbb769eed82839a5d2a39720301f7ea925580c94efcfbe8c1fce9779943db8814c417d87ffe335112946d69a6d51ac8a2aac81e008c38b915758dbb8d7f')

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
