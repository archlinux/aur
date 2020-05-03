# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=python-social-auth
pkgver=0.3.5
pkgrel=2
pkgdesc="Easy-to-setup social authentication/registration"
arch=(any)
url="https://github.com/omab/python-social-auth"
license=('BSD')
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools' 'git')
depends=('python-openid' 'python-requests' 'python-oauthlib'
         'python-requests-oauthlib' 'python-six' 'python-jwt')
source=("git+https://github.com/omab/python-social-auth#tag=${pkgver}"
	"import.patch::https://github.com/omab/python-social-auth/commit/f923691790086e6bd3ab79b93f39680e97286d09.patch")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/python-social-auth"
  git apply --stat "$srcdir"/import.patch
}

build() {
  cd "$srcdir/python-social-auth"
  python setup.py build
}

package() {
  cd "$srcdir/python-social-auth"
  python setup.py install --root="$pkgdir/" --optimize=1
  
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
