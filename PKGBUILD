pkgname=hyperledger-caliper-git
pkgver=116.1ac646a
pkgrel=1
pkgdesc="A blockchain benchmark framework to measure performance of multiple blockchain solutions"
arch=(i686 x86_64)
url="https://github.com/hyperledger/caliper"
license=('APACHE')
groups=('hyperledger')
depends=('nodejs')
makedepends=('git' 'npm')
source=("${pkgname%%-git}::git+https://github.com/hyperledger/caliper.git"
	start.sh)

package() {
	cd $srcdir/${pkgname%%-git}
	npm install
	mkdir -p "$pkgdir/usr/lib/node_modules/caliper/"
	cp -r * "$pkgdir/usr/lib/node_modules/caliper/"
	install -Dm775 ../start.sh "$pkgdir/usr/bin/caliper"
}

pkgver() {
        cd $srcdir/${pkgname%%-git}
        echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         '4d25cd7d1853de9608554b906f0cbef4')
