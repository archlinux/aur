# Maintainer: David Scholberg <recombinant.vector@gmail.com>

pkgname='goblocks'
pkgver=1.2.0
pkgrel=1
pkgdesc='Fast, lightweight i3status replacement written in Go'
arch=('x86_64'
      'i686')
url='https://github.com/davidscholberg/goblocks'
license=('custom:BSD')
install='goblocks.install'
makedepends=('git'
             'go>=1.7.0')
optdepends=('alsa-utils: volume status support'
            'zfs-utils: zfs status support')

_gopgkname='github.com/davidscholberg/goblocks'
_giturl="https://$_gopgkname.git"

prepare() {
    rm -rf "$srcdir"/{bin,pkg,src}
    git clone --branch "$pkgver" --depth 1 "$_giturl" "$srcdir/src/$_gopgkname"
}

build() {
    GOPATH="$srcdir" go get -v "$_gopgkname"
}

package() {
    _gitdir="$srcdir/src/$_gopgkname"

    install -p -m 755 -D -t "$pkgdir/usr/bin/" "$srcdir/bin/goblocks"
    install -m 644 -D -t "$pkgdir/usr/share/$pkgname/" "$_gitdir/README.md"
    install -m 644 -D -t "$pkgdir/usr/share/$pkgname/config/" \
        "$_gitdir/config/goblocks-full.yml"
    install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname/" \
        "$_gitdir/LICENSE"
}
