# Maintainer: Azuki <support@azukiapp.com>
pkgname='azk'
pkgver=0.18.0
pkgrel=1
pkgdesc="azk is a lightweight open source development environment orchestration tool. Instantly & safely run any environment on your local machine."
arch=('x86_64')
url="https://github.com/azukiapp/azk"
license=('Apache')
depends=('libnss-resolver' 'docker' 'rsync')
makedepends=('make' 'fakeroot' 'git')
conflicts=(${pkgname}-git)
source=("https://github.com/azukiapp/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('fe0d6a61c4bca2a3c1bea72515467758')

azk_last_commit_id=8b9f66c
azk_last_commit_date=2016-04-06

package() {
  cd "$srcdir/$pkgname-$pkgver"
  _create_package_envs
  make -e package_linux
  cp -a "$srcdir/$pkgname-$pkgver/package/v$pkgver/." "$pkgdir/"
}

_create_package_envs() {
  (
    echo "export AZK_LAST_COMMIT_ID=$azk_last_commit_id"
    echo "export AZK_LAST_COMMIT_DATE=$azk_last_commit_date"
  ) > .package-envs
}