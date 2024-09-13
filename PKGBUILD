# Maintainer: AbrarSyed <aur _AT_ abrarsyed _DOT_ com>
pkgname=cloudfoundry-cli
pkgver=8.8.1
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=(cf)
options=('!emptydirs' '!strip')

source=(
    "cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel"
    "cf-cli-completion::https://raw.githubusercontent.com/cloudfoundry/cli-ci/master/ci/installers/completion/cf"
)

md5sums=('428222dcc30c90f4d3512c10a25bcdb8'
         'b3dc7a45905e0dc58f3011f431befb90')
sha256sums=('d35522fdaad6b72f5b0638df97b8d4e6b7527609415ee87bf251923e248c0dd8'
            'f3f05a2414075c00b101b05f73cf260b9eec9966659adf2957c1b2937bd4c48e')
sha512sums=('16da47fd0f61e2758cfb4a6968f085d8dfd8012e6bae12a42229771ef37593e9a8f154fca25f9a5383fa86488708a02fc90f06f59eb9e0a435d50acd30226d27'
            '016e999430d8c78ed06eb283f31ed601d6d6fb5ee2da9253f84e2364a13fe1723dfd9501f6bf53019ef6f1b54eb8e094e11564ed3d154a475a43321a99d080ef')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf8 "$pkgdir/usr/bin"
	ln -s /usr/bin/cf8  "$pkgdir/usr/bin/cf"

	# copy completion file, ripped from Pappy's CF6 PKGBUILD
	install -Dm644 cf-cli-completion $pkgdir/usr/share/bash-completion/completions/cf

	#copy license & notice
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install $srcdir/LICENSE "$pkgdir/usr/share/doc/cf-cli/LICENSE"
	install $srcdir/NOTICE "$pkgdir/usr/share/doc/cf-cli/NOTICE"
}

