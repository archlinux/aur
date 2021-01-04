# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=gnome-flashback-xmonad-nopanel
pkgver=0.0.1
pkgrel=1
pkgdesc="XMonad support for Gnome Flashback"
arch=('any')
license=('GPL2')
depends=('gnome-flashback')
optdepends=('xmonad')
source=(
    'gnome-flashback-xmonad'
    'gnome-flashback-xmonad.desktop'
    'gnome-flashback-xmonad.session'
    'gnome-session-x11@gnome-flashback-xmonad.target'
    'xmonad.desktop'
)
sha256sums=('0e494a6ed89c8862804171ec6dd8add17ff47fce16eab67b86126cae1c43fd2c'
            '263b22e38d661991224460cfeeb83b3993f51d85e9fc02425ddde235167e0f74'
            '45fe2b67f129ca0605223f599461c5bba80ed52872b356e36b01f9811d0926a6'
            '6ff49d3d4fbd6a10024a479cdcbace1a66632fb49976e501a5b244558d64ff2f'
            'c7260b897c32261f74c0b43e1094df405b661057180422b7913c8ac3fb7aafc0')

package() {
    cd "$srcdir"
    umask 0022
    fs=(
        'gnome-flashback-xmonad' /usr/lib/gnome-flashback 0755
        'gnome-flashback-xmonad.desktop' /usr/share/xsessions 0644
        'gnome-flashback-xmonad.session' /usr/share/gnome-session/sessions 0644
        'gnome-session-x11@gnome-flashback-xmonad.target' /usr/lib/systemd/user 0644
        'xmonad.desktop' /usr/share/applications 0644
    )
    for ((i=0; i < ${#fs[@]}; i+=3)); do
        f=${fs[$i]}
        d=$pkgdir/${fs[$((i+1))]}/
        m=${fs[$((i+2))]}
        mkdir -p "$d"
        install -m "$m" -t "$d" "$f"
    done
}
