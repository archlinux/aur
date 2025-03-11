# Maintainer: AbrarSyed <aur _AT_ abrarsyed _DOT_ com>
pkgname=cloudfoundry-cli
pkgver=8.11.0
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

md5sums=('adf852c721246b160cc95035dda3e940'
         'b3dc7a45905e0dc58f3011f431befb90')
sha256sums=('a3aed2f07363fd0cb4fa1c0944511ea766364688015840ed79bb126033c3ca13'
            'f3f05a2414075c00b101b05f73cf260b9eec9966659adf2957c1b2937bd4c48e')
sha512sums=('93b32beb511b47f57b8142577da46637af2ef3ced3b0f869d59727d5cdf66dcea7f736e4ff8271a237bebd159c0c4640cb36ea1b69886532588602ee7a94e903'
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

