# Maintainer: Bradley Cicenas <bradley.cicenas@gmail.com>
pkgname=slackcat
pkgver=1.7.3
pkgrel=${PKGREL:-1}
pkgdesc="Commandline utility for posting snippets to Slack"
arch=('i686' 'x86_64')
url='https://github.com/bcicen/slackcat'
license=('GPL')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"slackcat::git://github.com/vektorlab/slackcat.git#tag=$pkgver"
)

md5sums=(
	'SKIP'
)

backup=(
)

build() {
	cd "$srcdir/$pkgname"

	git submodule init
	git submodule update

	echo "Running 'go mod download'..."
  go mod download

	echo "Running 'go build'..."
  go build -tags osusergo,netgo -ldflags "-s -X main.version=${pkgver} -X main.build=${pkgrel}" -o slackcat
}

package() {
  install -DT "$srcdir/$pkgname/slackcat" "$pkgdir/usr/bin/slackcat"
}
