# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-tip
pkgver=1.13beta1
pkgrel=1
pkgdesc='Core compiler tools for the Go programming language'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
provides=(go)
conflicts=(go)
source=(https://storage.googleapis.com/golang/go$pkgver.linux-amd64.tar.gz
        https://storage.googleapis.com/golang/go$pkgver.linux-amd64.tar.gz.asc)
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')
sha512sums=('b623d833764349d114caa41c86ac9383f121fc12e38cc30a0c50f9ec29f8a63d95c91d1037c4702c98dbfda1ba685ec2b1ea7f86e084e08b28a2a93094ef941b'
            'SKIP')

package() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go

  options=(!strip staticlibs)
  cd "$srcdir/go"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go" "$pkgdir/usr/share/doc/go"
  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/go"
  cp -r doc/* "$pkgdir/usr/share/doc/go"

  ln -sf /usr/lib/go/bin/go "$pkgdir/usr/bin/go"
  ln -sf /usr/lib/go/bin/gofmt "$pkgdir/usr/bin/gofmt"
  ln -sf /usr/share/doc/go "$pkgdir/usr/lib/go/doc"

  install -Dm644 VERSION "$pkgdir/usr/lib/go/VERSION"

  rm -rf "$pkgdir/usr/lib/go/pkg/bootstrap" "$pkgdir/usr/lib/go/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/go/pkg/obj/go-build/*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$1/LICENSE"
}

# vim: ts=2 sw=2 et
