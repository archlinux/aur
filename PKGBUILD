# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-data-ubuntuusersde
pkgver=0.24.0
pkgrel=1
_lang=de_DE   # Need to set LC_CTYPE/LANG because of filenames with special characters
pkgdesc='ubuntuusers.de community files for InyokaEdit'
arch=('any')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL3')
depends=('bash')
optdepends=('inyokaedit: Editor for Inyoka based portals'
            'inyokaedit-plugins: Plugins for InyokaEdit')
source=("https://github.com/inyokaproject/inyokaedit/releases/download/v$pkgver/inyokaedit-community-$pkgver.zip")
sha256sums=('438e4699b0267d54a514efeba9ebe9131ec0bbc1bc379bc34e0d19fe14217539')

build() {
    mv inyokaedit-community/ community/
    wget -nv "$url/raw/v$pkgver/configure" -O configure
    chmod +x configure
    wget -nv "$url/raw/v$pkgver/Makefile" -O Makefile
    chmod +x Makefile
    ./configure --prefix=/usr --community=ubuntuusers_de
}

package() {
    export LC_CTYPE=$_lang.UTF-8
    export LANG=$_lang.UTF-8
    make DESTDIR="$pkgdir/" install-data-ubuntuusersde
}
