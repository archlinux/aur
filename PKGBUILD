# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=srndv2-git
_pkgname=srndv2
pkgver=20150804
pkgrel=1
pkgdesc="Some Random News Daemon version 2. Git version."
arch=('any')
url="https://github.com/majestrate/srndv2"
license=('NFRUPL')	#LOL
depends=('go>=1.4' 'libsodium>=1.0' 'imagemagick' 'postgresql')
makedepends=('git')
optdepends=('nntpchan-git: Decentralized imageboard')
provides=($_pkgname)
conflicts=($_pkgname)
install=srndv2.install
source=("${_pkgname}::git+https://github.com/majestrate/srndv2")
md5sums=('SKIP')

pkgver()
{
	cd $srcdir/$_pkgname
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build()
{
	cd $srcdir/$_pkgname
	mkdir -p go
	echo "Downloading..."
	GOPATH=$srcdir/$_pkgname/go go get github.com/majestrate/srndv2
}

package()
{
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/${_pkgname}/go/bin/srndv2" "${pkgdir}/usr/bin"

	install -Dm0644 "../srndv2.service" "${pkgdir}/usr/lib/systemd/system/srndv2.service"
}
