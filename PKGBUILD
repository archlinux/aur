# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-data-ubuntuusersde
pkgver=0.28.1
pkgrel=1
_lang=de_DE   # Need to set LC_CTYPE/LANG because of filenames with special characters
pkgdesc='ubuntuusers.de community files for InyokaEdit'
arch=('any')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL-3.0-or-later')
depends=('bash')
optdepends=('inyokaedit: Editor for Inyoka based portals'
            'inyokaedit-plugins: Plugins for InyokaEdit')
source=("https://github.com/inyokaproject/inyokaedit/releases/download/v$pkgver/inyokaedit-community-$pkgver.zip")
sha256sums=('10b1761e0bdd11cb8dc6a5b5b69c639f37a2a2e812a259b82ce4c3c631388d67')

build() {
    mv inyokaedit-community/ community/
    wget -nv "$url/raw/v$pkgver/CMakeLists.txt" -O CMakeLists.txt
    cmake -B build-cmake -DCMAKE_INSTALL_PREFIX="/usr" \
      -DBUILD_COMMUNITY_ONLY=ON \
      -DBUILD_APPLICATION=OFF \
      -DCOMMUNITY=community/ubuntuusers_de
}

package() {
    export LC_CTYPE=$_lang.UTF-8
    export LANG=$_lang.UTF-8
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
