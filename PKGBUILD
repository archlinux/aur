# Maintainer: Pekman
# PKGBUILD Based in Iceweasel-bin

# We're getting this from Debian Stable (Jessie)

_debname=iceweasel
_debver=38.7.0esr
_debrel=1~deb8u1
_debrepo=http://security.debian.org/debian-security/pool/updates/main/i/

pkgname=iceweasel-stable-bin
pkgver=${_debver}.deb${_debrel}
pkgrel=1
pkgdesc="Debian Stable (Jessie) Browser based on Mozilla Firefox (bin version)"
arch=('i686' 'x86_64')
url="https://packages.debian.org/jessie/iceweasel"
license=('MPL' 'GPL' 'LGPL')
conflicts=("$_debname")
provides=("$_debname"="$_debver")

depends=('gtk2' 'icu' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme' 'libvpx' 'libevent' 'nss' 'hunspell' 'sqlite')

optdepends=('iceweasel-sync: Speed up Iceweasel using tmpfs'
            'mozplugger: A Mozilla & Firefox multimedia plugin.'
            'mozilla-searchplugins: extra search plugins'
            'iceweasel-extension-archsearch: Iceweasel Arch search engines (AUR, Pkgs, BBS, Wiki, etc.)'
            'iceweasel-extension-archforumsearch-it: Iceweasel search engines for Arch Linux Italian forum'
            'gst-libav: h.264 video'
            'gst-plugins-good: h.264 video'
            'networkmanager: Location detection via available WiFi networks')

install=iceweasel.install

 if [ "$CARCH" = "x86_64" ]; then
    _debarch=amd64
    sha256sums=('4c24364aab9351313bf38353cb2813f62e7d9197a5d4a799850227b1762e95c7')
else
    _debarch=i386
    sha256sums=('7dcd297eb8c1175da237374a9e5ebb99866621a615740556cf1ceac4ef2c22de')
 fi

source=("${_debrepo}/${_debname}/${_debname}_${_debver}-${_debrel}_${_debarch}.deb")

package(){
      msg2 "Installing Iceweasel..."
      tar Jxvf "${srcdir}"/data.tar.xz -C "$pkgdir"/

      msg2 "Cleaning up unwanted files..."
      rm -rv "${pkgdir}"/usr/lib/{mozilla,mime}
      rm -rv "${pkgdir}"/usr/share/{bug,mozilla,doc}
      rm -v "${pkgdir}"/usr/bin/firefox
}

# vim:set ts=2 sw=2 et:
