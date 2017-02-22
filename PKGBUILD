# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=git-secrets
pkgver=1.2.1
pkgrel=1
pkgdesc="Prevents you from committing secrets and credentials into git repositories"
arch=('any')
url="https://github.com/awslabs/git-secrets"
license=('custom:APLv2')
depends=('git')
makedepends=('git' 'gcc' 'make')
source=("$pkgname"::'git+https://github.com/awslabs/git-secrets.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags $(git rev-list --tags --max-count=1) | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  git checkout tags/$pkgver
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make PREFIX="$pkgdir/usr/" install
}
