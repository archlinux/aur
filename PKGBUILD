pkgname=wsdd2
pkgver=1.8.1
pkgrel=1
pkgdesc="WSD/LLMNR Discovery/Name Service Daemon. Install it to make Samba shares discoverable on Windows hosts."
url="https://github.com/Andy2244/wsdd2"
arch=(x86_64)
license=(GPL)
depends=()
makedepends=()
_commit=a50d4cf03f31c3d07a257b9e7448c3f2e9896967
source=(
	"https://github.com/Andy2244/wsdd2/archive/$_commit.zip"
)
sha256sums=('a8555aa44c854269b0975379fb1dab940c6e5a8c7c539c57c5b974ce666ed0ce')

build()
{
	cd "$srcdir/$pkgname-$_commit"
	make
}

package()
{
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/usr/lib/systemd/system/smb.service.wants"

    cd "$srcdir/$pkgname-$_commit"
    cp "wsdd2" "$pkgdir/usr/bin"
    cp "wsdd2.service" "$pkgdir/usr/lib/systemd/system"
    cd "$pkgdir/usr/lib/systemd/system/smb.service.wants"
    ln -s "../wsdd2.service" .
}

