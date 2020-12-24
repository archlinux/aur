# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=leagueoflegends-git
pkgver=0.10.12.r0.gc44d767
pkgrel=1
pkgdesc="League of Legends helper script"
arch=('any')
url="https://github.com/kyechou/leagueoflegends"
license=('GPL3')
depends=('wine-lol' 'winetricks' 'bash' 'lib32-gnutls' 'lib32-libldap'
         'lib32-openal' 'lib32-libpulse' 'wget')
conflicts=('leagueoflegends')
source=("$pkgname"::'git+https://github.com/kyechou/leagueoflegends')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

package() {
    cd "$srcdir/$pkgname"
    make install PREFIX="$pkgdir"
}
