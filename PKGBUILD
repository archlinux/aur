# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: wido <widowild [at] myopera [dot] com>
# Contributor: Skippy the Kangoo <Skippythekangoo CHEZ yahoo POINT fr>

pkgbase='sat-xmpp'
pkgname=('sat-xmpp' 'sat-jp' 'sat-primitivus' 'sat_media')
_realname=sat
_medianame=sat_media
_pubsubname=sat_pubsub
pkgver=0.6.1
pkgrel=2
url="http://salut-a-toi.org/"
arch=('any')
depends=('python2' )
makedepends=('python2-setuptools')
license=('AGPL3')
source=("ftp://ftp.goffi.org/$_realname/$_realname-${pkgver}.tar.bz2"
        "ftp://ftp.goffi.org/$_medianame/$_medianame-${pkgver}.tar.bz2"
        "hg+http://repos.goffi.org/sat_pubsub")
md5sums=('c50442bb2314f4253361d77ce442eaf4'
         '5a334e6d9a9237737fd82488d56538f6'
         'SKIP')
options=('!strip')

build() {
    cd "$srcdir/$_realname-$pkgver"
    python2 setup.py build

    install -dm755 "$srcdir/fakeinstall/"
    SAT_INSTALL=nopreinstall python2 setup.py install --root="$srcdir/fakeinstall/" --prefix=/usr --optimize=1
}

package_sat-xmpp(){
    pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (core)"
    depends=('dbus' 'python2-lxml>=3.1.0' 'python2-pillow' 'python2-crypto>=2.6.1' 'python2-pyopenssl' 'python2-dbus' 'python2-potr' 'python2-twisted>=15.2.0' 'python2-wokkel>=0.7.1' 'python2-xdg' 'python2-zope-interface' 'mutagen' 'python2-markdown' 'python2-html2text' 'python2-netifaces' 'python2-miniupnpc' 'python2-service-identity' 'python2-dateutil' 'python2-gobject2')

     cd "$pkgdir"
     install -dm755 usr/bin/
     install -dm755 usr/lib/python2.7/site-packages/
     install -dm755 usr/lib/python2.7/site-packages/sat_frontends

     cd "$srcdir/fakeinstall"
     mv -v usr/bin/sat "$pkgdir/usr/bin/"
     mv -v usr/share/ "$pkgdir/usr/"
     mv -v usr/lib/python2.7/site-packages/sat/ "$pkgdir/usr/lib/python2.7/site-packages/"
     mv -v usr/lib/python2.7/site-packages/twisted/ "$pkgdir/usr/lib/python2.7/site-packages/"
     mv -v usr/lib/python2.7/site-packages/$_realname-$pkgver-py2.7.egg-info/ "$pkgdir/usr/lib/python2.7/site-packages/"
     for i in bridge __init__.py* quick_frontend tools; do
     mv -v "usr/lib/python2.7/site-packages/sat_frontends"/$i "$pkgdir/usr/lib/python2.7/site-packages/sat_frontends/"
     done
 }

package_sat-jp(){
    pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (CLI frontend)"
    depends=('sat-xmpp' 'python2-gobject' 'python2-progressbar' 'python2-pyinotify')

    cd "$pkgdir"
    install -dm755 usr/bin/
    install -dm755 usr/lib/python2.7/site-packages/sat_frontends/

    cd "$srcdir/fakeinstall"
    mv -v usr/bin/jp "$pkgdir/usr/bin/"
    mv -v usr/lib/python2.7/site-packages/sat_frontends/jp/ "$pkgdir/usr/lib/python2.7/site-packages/sat_frontends/"
}

package_sat-primitivus(){
    pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (console frontend)"
    depends=('sat-xmpp' 'python2-gobject' 'python2-urwid>=1.2.0' 'python2-urwid-satext>=0.6.1' 'python2-xlib')

    cd "$pkgdir"
    install -dm755 usr/bin/
    install -dm755 usr/lib/python2.7/site-packages/sat_frontends/
                                                                         
    cd "$srcdir/fakeinstall"
    mv -v usr/bin/primitivus "$pkgdir/usr/bin/"
    mv -v usr/lib/python2.7/site-packages/sat_frontends/primitivus/ "$pkgdir/usr/lib/python2.7/site-packages/sat_frontends/"
}

package_sat_media(){
    pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (media files)"

    cd "$pkgdir"
    install -dm755 usr/share/sat/media/

    cd "$srcdir/$_medianame-$pkgver"
    cp -rv * "$pkgdir/usr/share/sat/media/"
}
