# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-data-ubuntuusersde
pkgver=0.28.3
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
sha256sums=('a95813ac1fe0311cd1086c4218a1ecff825e24df1e7edac83bd8df26042c59a4')

build() {
    mv inyokaedit-community/ community/
    wget -nv "$url/raw/v$pkgver/CMakeLists.txt" -O CMakeLists.txt
    cmake -B build-cmake -DCMAKE_INSTALL_PREFIX="/usr" \
      -DINY_BUILD_COMMUNITY_ONLY=ON \
      -DINY_BUILD_APPLICATION=OFF \
      -DINY_COMMUNITY=community/ubuntuusers_de
}

package() {
    export LC_CTYPE=$_lang.UTF-8
    export LANG=$_lang.UTF-8
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
