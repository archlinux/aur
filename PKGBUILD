# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Eric Toombs <ewtoombs@uwaterloo.ca>
_shortname='xmpp-ignore-groups'
pkgname="pidgin-$_shortname"
pkgver='0.1'
pkgrel='2'
pkgdesc='A plugin for Pidgin/Finch/libpurple that will ignore server-sent groups (eg on Facebook XMPP).'
arch=('i686' 'x86_64')
url="https://github.com/EionRobb/pidgin-xmpp-ignore-groups"
license=('unknown')
depends=('pidgin')
source=(https://github.com/EionRobb/pidgin-xmpp-ignore-groups/archive/$pkgver.tar.gz)
md5sums=('b7027be445eb505fcf6471acfd69cbb6')

_soname="$_shortname.so"
_plugindir="`pkg-config --variable=plugindir purple`"

build() {
	cd pidgin-xmpp-ignore-groups-$pkgver
    # Display the commands in full as they are run.
    set -x
    gcc -o "$_soname" -shared -fPIC `pkg-config --cflags --libs purple` \
        -L"$_plugindir" -ljabber "$_shortname.c"
    # Turn that displaying off.
    set +x
}

package() {
	cd pidgin-xmpp-ignore-groups-$pkgver
    mkdir -p "$pkgdir$_plugindir"
    cp "$_soname" "$pkgdir$_plugindir"
}
