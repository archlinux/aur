# Maintainer: Carl George < carl at george dot computer >

pkgname='pop-gtk-theme'
pkgver='1.3.1.13'
_tag='1.3.1r13'
pkgrel=1
pkgdesc='System76 Pop GTK+ Theme (GNOME, Budgie, XFCE, MATE)'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
makedepends=(
    'autoconf'
    'automake'
    'inkscape'
    'gdk-pixbuf2>=2.32.2'
    'glib2>=2.48.0'
    'gnome-shell>=3.18.3'
    'librsvg>=2.40.13'
    'libsass>=3.3.6'
    'libxml2'
    'pkg-config'
    'sassc>=3.3.2'
    'parallel'
)
source=("$url/archive/$_tag/$pkgname-$_tag.tar.gz")
sha256sums=('50e06154571b850e2e0a319ddabe979046069100eb1b434b406a2f24fad62d40')

prepare() {
    cd "$pkgname-$_tag"
    ./autogen.sh \
        --disable-flashback \
        --disable-unity \
        --enable-nokto \
        --enable-chrome \
        --enable-plank \
        --enable-telegram \
        --enable-parallel
}

build() {
    cd "$pkgname-$_tag"
    make
}

package() {
    depends=(
        'gtk2>=2.24.30'
        'gtk3>=3.18.9'
        'gdk-pixbuf2>=2.24.30'
        'gtk-engine-murrine>=0.98.1'
    )
    optdepends=(
        'gnome-shell>=3.18.3: GNOME Shell'
        'budgie-desktop>=10.2.7: Budgie desktop'
        'xfdesktop>=4.12.2: XFCE desktop'
        'mate-desktop>=1.14.0: MATE desktop'
    )
    cd "$pkgname-$_tag"
    make DESTDIR="$pkgdir" install
}
