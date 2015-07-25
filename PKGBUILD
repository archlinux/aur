# Maintainer: Eric Toombs <ewtoombs@uwaterloo.ca>
_shortname='xmpp-ignore-groups'
pkgname="pidgin-$_shortname"
# This is the version of the Windows DLL available from the website. It should 
# be approximitely right.
pkgver='0.1'
pkgrel='1'
pkgdesc='A plugin for Pidgin/Finch/libpurple that will ignore server-sent groups (eg on Facebook XMPP).'
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname/"
license=('unknown')
depends=('pidgin')
makedepends=('subversion')
source=("svn+http://$pkgname.googlecode.com/svn/trunk/")
md5sums=('SKIP') #generate with 'makepkg -g'

_soname="$_shortname.so"
_plugindir="`pkg-config --variable=plugindir purple`"

build() {
	cd "$srcdir/trunk"
    # Display the commands in full as they are run.
    set -x
    gcc -o "$_soname" -shared -fPIC `pkg-config --cflags --libs purple` \
        -L"$_plugindir" -ljabber "$_shortname.c"
    # Turn that displaying off.
    set +x
}

package() {
	cd "$srcdir/trunk"
    mkdir -p "$pkgdir$_plugindir"
    cp "$_soname" "$pkgdir$_plugindir"
}
