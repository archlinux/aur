# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=nntpchan-git
_pkgname=nntpchan
pkgver=20150804
pkgrel=1
pkgdesc="Decentralized imageboard that uses nntp to synchronize content between many different servers. It utilizes cryptograpghicly signed posts to perform optional/opt-in decentralized moderation. Git version."
arch=('any')
url="https://github.com/majestrate/nntpchan"
license=('unknown')
depends=('go>=1.4' 'libsodium>=1.0' 'imagemagick' 'postgresql')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
install=nntpchan.install
source=("${_pkgname}::git+https://github.com/majestrate/nntpchan")
md5sums=('SKIP')

pkgver()
{
	cd $_pkgname
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build()
{
	cd $_pkgname
	mkdir -p go bin
	export GOPATH=$srcdir/$_pkgname/go
	export PATH=$PATH:$srcdir/$_pkgname/bin
	echo "Downloading..."
	go get github.com/majestrate/srndv2
}

package()
{
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/${_pkgname}/go/bin/srndv2" "${pkgdir}/usr/bin"
}
