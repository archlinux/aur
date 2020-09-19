# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go"
pkgver=0.1.9
pkgrel=2
pkgdesc="A web app for managing users on Jellyfin"
arch=("x86_64")
url="https://github.com/hrfee/jfa-go"
license=('MIT')
makedepends=('go>=1.14' 'python>=3.6.0-1' 'nodejs' 'npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("jfa-go::git+https://github.com/hrfee/jfa-go.git#tag=v$pkgver")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
    cd jfa-go
    make configuration sass-headless mail-headless version
}

build() {
	cd jfa-go
	make compile
}

package() {
    cd jfa-go
    make copy
    install -d "$pkgdir"/opt
    make install DESTDIR="$pkgdir"/opt
    mkdir -p "$pkgdir"/usr/bin
    chown -R root "$pkgdir"/opt/$pkgname/
    chmod 755 "$pkgdir"/opt/$pkgname/$pkgname
    ln -sf /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname 
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
