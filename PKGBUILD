# Maintainer: AbrarSyed <aur _AT_ abrarsyed _DOT_ com>
pkgname=cloudfoundry-cli
pkgver=8.8.3
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

md5sums=('77ae37dd7834e3bb758a7b36f7ccf9c1'
         'b3dc7a45905e0dc58f3011f431befb90')
sha256sums=('dc99c08b234075788409455e36ded7243a77573a1291dd61d990a4ca59718776'
            'f3f05a2414075c00b101b05f73cf260b9eec9966659adf2957c1b2937bd4c48e')
sha512sums=('d50d5926752e68420cc97a23f9e3f539fa2aa7512832ebad7c4b9fc88c3a2fabb5414877b48f9bd6379d252c3fc1aad38b5d860a730f5e8a5c3c5b4c57a61011'
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

