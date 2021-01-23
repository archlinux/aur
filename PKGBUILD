# Maintainer: Simon Reiser <me@sfxr.de>

# Mostly based on https://github.com/Gekkio/gnome-session-xmonad/

pkgname=gnome-flashback-xmonad-nopanel
pkgver=0.2.0
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
    'session.conf'
    'xmonad.desktop'
)
sha256sums=('55c410abe2b3743cda316de9bd4b520bc0cb06cf34fcdc98e56a07a534d3959e'
            '263b22e38d661991224460cfeeb83b3993f51d85e9fc02425ddde235167e0f74'
            'fdfe8bf784bd7f5806a693034f28702296c8a7cefab7f3e01af1a91c8d03bca2'
            '323c0f8b0c04d5580067816d2a23bf34c0818462181a7a08f29c4aba097ca111'
            'c7260b897c32261f74c0b43e1094df405b661057180422b7913c8ac3fb7aafc0')

package() {
    cd "$srcdir"
    umask 0022
    fs=(
        'gnome-flashback-xmonad' /usr/lib/gnome-flashback 0755
        'gnome-flashback-xmonad.desktop' /usr/share/xsessions 0644
        'gnome-flashback-xmonad.session' /usr/share/gnome-session/sessions 0644
        'session.conf' /usr/lib/systemd/user/gnome-session@gnome-flashback-xmonad.target.d 0644
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
