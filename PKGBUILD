# Maintainer: Carl George < arch at cgtx dot us >

pkgname='pop-gtk-theme'
pkgver=1.0.8
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
    'librsvg>=2.40.13'
    'libsass>=3.3.6'
    'libxml2'
    'pkg-config'
    'sassc>=3.3.2'
    'parallel'
)
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+files/system76-pop-gtk-theme_$pkgver.tar.xz"
        'fix-chrome-nokto-install.patch')
sha256sums=('8d38e1b64bbe3668103e5abced61135f2c4955848b0cd3df1da52464e6cc3932'
            '11d334221e2fb8edb36d6e5ca50dd0083c12695394a66f61aa7846da5dbfa71c')

prepare() {
    patch -p0 -i fix-chrome-nokto-install.patch
    cd gtk-theme
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
    cd gtk-theme
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
    cd gtk-theme
    make DESTDIR="$pkgdir" install
}
