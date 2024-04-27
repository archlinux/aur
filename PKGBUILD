# Maintainer: Simon Reiser <me@sfxr.de>

# Mostly based on https://github.com/Gekkio/gnome-session-xmonad/

pkgname=gnome-flashback-xmonad-nopanel
pkgver=0.2.2
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
sha256sums=('ead1c94c4ed1ef2da76fed2793a57ac7a94e4743f8829f747eb2f8e5d4c1d13b'
            '34ef0f4664ebba1e9877be67df23506b74968327689bdca02dccd0ecf1b670f2'
            'fdfe8bf784bd7f5806a693034f28702296c8a7cefab7f3e01af1a91c8d03bca2'
            '323c0f8b0c04d5580067816d2a23bf34c0818462181a7a08f29c4aba097ca111'
            '525f7e792f4bb545a7ec2da97da6e07960468fdff48f9a5f51699287511a64d9')

package() {
    cd "$srcdir"
    umask 0022
    fs=(
        'gnome-flashback-xmonad' /usr/lib 0755
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
