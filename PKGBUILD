# Maintainer: A. Karmanov <a.karmanov@inventati.org>

pkgname=gixy-next
pkgver=0.3.4
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url='https://gixy.io'
license=('MPL-2.0')
depends=(
  'crossplane-gixy'  # Maintained crossplane fork
  'python'
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
b2sums=('70ddb9594b58644c7993af49418f3ee9af3765d4c73db223d179d073dba8563398db7aa263ae1e3396d9cb203acad523356ea78a95e99e06e47ec797976075a4')

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
