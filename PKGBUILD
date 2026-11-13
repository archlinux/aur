# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Paul Spruce <paul.spruce@gmail.com>

_pkgname=waybackurls
pkgname=$_pkgname-bin
pkgver=0.1.0
pkgrel=3
pkgdesc='Fetch all the URLs that the Wayback Machine knows about for a domain'
arch=('x86_64')
url="https://github.com/tomnomnom/waybackurls"
# Upstream declares no license at any commit and ships no license text, so the
# package claims none rather than asserting a license on the author's behalf.
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-$pkgver.tgz"
        "$pkgname-$pkgver-README.mkd::https://raw.githubusercontent.com/tomnomnom/waybackurls/v$pkgver/README.mkd")
sha256sums=('884786132d11c8eb838fc88626dad96494207c79e436a72870a7d69f147500a6'
            'ffdf6f50d0cab97eee8d37b6739fa49bd94708e4955cf538f59a7c7c7929b24b')

latestver() {
    gh api repos/tomnomnom/waybackurls/releases/latest --jq '.tag_name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p'
}

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$pkgname-$pkgver-README.mkd" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
