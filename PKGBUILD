# Maintainer: superlex
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com>

# We're getting this from Debian Experimental

_debname=iceweasel
_debver=41.0.1
_debrel=1
_debrepo=http://ftp.de.debian.org/debian/pool/main/i/
 
pkgname=iceweasel-bin
pkgver=${_debver}.deb${_debrel}
pkgrel=1
pkgdesc="Debian Browser based on Mozilla Firefox (bin version)"
arch=('i686' 'x86_64')
url=("https://packages.debian.org/experimental/iceweasel")
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
    sha1sums=('74fac43c0aa50a6a46f2eec37e0dd7068ec299f5')
else
    _debarch=i386
    sha1sums=('582bc32c497deead45141924b5409b877c0d30cb')
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
