# Maintainer: Carl George < arch at cgtx dot us >

pkgname='pop-gtk-theme'
pkgver=1.3.1.12
# Upstream sometimes forgets to tag.
_commit=66b247399ad92e58dfea6cb75b2e36a980e3698d
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
#source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('5bf501060b1b948f8ffda8ef4fddbddf31996522a116167567d51a6f08d76eea')

prepare() {
    #cd "$pkgname-$pkgver"
    cd "$pkgname-$_commit"
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
    #cd "$pkgname-$pkgver"
    cd "$pkgname-$_commit"
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
    #cd "$pkgname-$pkgver"
    cd "$pkgname-$_commit"
    make DESTDIR="$pkgdir" install
}
