# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=gnome-flashback-xmonad-nopanel
pkgver=0.1.0
pkgrel=1
pkgdesc="XMonad support for Gnome Flashback"
arch=('any')
license=('GPL2')
depends=('gnome-flashback')
provides=( gnome-flashback-xmonad )
conflicts=( gnome-flashback-xmonad )
replaces=( gnome-flashback-xmonad )
optdepends=( 'xmonad: some xmonad binary is required, you may place your own instead of relying on the package manager' )

source=(
    'gnome-flashback-xmonad'
    'gnome-flashback-xmonad.desktop'
    'gnome-flashback-xmonad.session'
    'gnome-session-x11@gnome-flashback-xmonad.target'
    'xmonad.desktop'
)
sha256sums=('55c410abe2b3743cda316de9bd4b520bc0cb06cf34fcdc98e56a07a534d3959e'
            '263b22e38d661991224460cfeeb83b3993f51d85e9fc02425ddde235167e0f74'
            '038f3cf81d27c56c5f52d43d59c931a031c06cb78e2911b9daf4c2f86dee13e9'
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
