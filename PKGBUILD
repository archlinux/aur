#Maintainer: jnanar <info@agayon.be>
# Contributor: wido <widowild [at] myopera [dot] com>
# Contributor: Skippy the Kangoo <Skippythekangoo CHEZ yahoo POINT fr>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='sat-xmpp-hg'
pkgname=('sat-xmpp-hg')
_realname=sat
pkgver=0.7.0.r2577.1209a5d83082
VERSION=0.7.0
pkgrel=1
url="http://salut-a-toi.org/"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools' 'mercurial')
license=('AGPL3')
source=("hg+http://repos.goffi.org/sat")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$VERSION.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" 
}
                 
build() {
    cd "$srcdir/$_realname"
    python2 setup.py build
                         
    install -dm755 "$srcdir/fakeinstall/"
    python2 setup.py install --root="$srcdir/fakeinstall/" --prefix=/usr --optimize=1
}

package(){
    pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (core)"
    depends=('dbus' 'python2-lxml>=3.1.0' 'python2-pillow' 'python2-pycryptodomex>=2.6.1' 'python2-pyopenssl' 'python2-dbus' 'python2-potr' 'python2-twisted' 
'python2-wokkel>=0.7.1' 'python-xdg' 'python2-zope-interface' 'mutagen' 'python2-markdown' 'python2-xdg' 'python2-shortuuid-git' 'python2-gobject2' 'python2-html2text' 'python2-netifaces' 'python2-miniupnpc' 'python2-service-identity' 'sat-tmp' 'python2-dateutil' 'python2-regex' 'python2-gobject' 'python2-progressbar' 'python2-pyinotify' 'python2-babel' 'python2-urwid>=1.2.0' 'python2-urwid-satext>=0.6.1' 'python2-xlib')

     cd "$pkgdir"
     install -dm755 usr/bin/
     install -dm755 usr/lib/python2.7/site-packages/
     install -dm755 usr/lib/python2.7/site-packages/sat_frontends
                                 
     cd "$srcdir/fakeinstall"
     mv -v usr/bin/* "$pkgdir/usr/bin/"
     mv -v usr/share/ "$pkgdir/usr/"
     mv -v usr/lib/python2.7/site-packages/{sat-*,sat_frontends,sat} "$pkgdir/usr/lib/python2.7/site-packages/"
     mv -v usr/lib/python2.7/site-packages/twisted/ "$pkgdir/usr/lib/python2.7/site-packages/"
 }



