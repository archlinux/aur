# Maintainer: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='A Kubernetes management tool'
pkgver=3.1.0_beta.1
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://github.com/lensapp/lens'
makedepends=('nodejs-lts-erbium' 'yarn' 'electron6')
source=("$pkgname-${pkgver/_/-}.tar.gz::https://github.com/lensapp/lens/archive/v${pkgver/_/-}.tar.gz"
        "lens.sh"
        "lens.desktop")
#source=("$pkgname-${pkgver/_/-}::git+https://github.com/lensapp/lens.git#branch=master")
sha256sums=('7e6b854cde1805cc3422b8893ea708ba89facbedb263e4cc31e8a52d326f8812'
            'ef469cad4eaea7fbafedcd96cbc4ccba3db158b554841536a4d558c93ef98203'
            '2427ae570b5433cef30bfd9501dacbc06a29327dd12b3fd613185d8ee7fb1309')

build() {
  cd $pkgname-${pkgver/_/-}

  make build
}

package() {
  cd $pkgname-${pkgver/_/-}

  # Linked libs
  install -dm 755 "$pkgdir/usr/lib/$pkgname"
  cp -r dist/linux-unpacked/resources "$pkgdir"/usr/lib/$pkgname/

  # Icon
  install -Dm 644 build/icons/512x512.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png

  # Desktop file
  install -Dm 644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Launcher script
  install -Dm 755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
