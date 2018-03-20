# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Samuel Walladge <samuel@swalladge.id.au>

pkgname=toggldesktop-bin
_pkgname=toggldesktop
pkgver=7.4.71
pkgrel=1
pkgdesc="Time Tracking Software."
arch=('x86_64')
provides=('toggldesktop')
conflicts=('toggldesktop' 'toggl-bin')

depends=('libxss'
  'openssl'
  'qt5-base'
  'qt5-declarative'
  'qt5-location'
  'qt5-sensors'
  'qt5-svg'
  'qt5-webchannel'
  'qt5-webkit')

url='https://toggl.com/'
source=('removelibs.list'
  'toggldesktop.deb::https://toggl.com/api/v8/installer?app=td&platform=deb64&channel=stable'
  'toggldesktop.bin')

sha512sums=('5c8fc6fcc8d9905455cc54a61412dc772667599c5abab056d308223c54c85ef47afc3078acbb44ac84f8e1b31ccd838d245e3ce0a3037ddec9201549125f6847'
            '116a432dc16ba2bc21beddcc185a17817599b3adcb8155b503887d4831a569cb618971e03a2afdb603fcedd28b2139dddcd695dbc0cbab3a83b26452f23aee64'
            'b8669361b7c0cdbaec8a2225085aac9e26c2e99122b0840543685d06bf2fa7410722276ce1fa26374a313e5af6de47f70d84fac8261a35745953b85adb1ce0bb')

prepare() {
  tar -xf data.tar.xz
  for lib in `cat removelibs.list`; do
    rm -rf $srcdir/opt/toggldesktop/lib/$lib
  done
}

package() {
  cp -a $srcdir/opt/ $srcdir/usr/ $pkgdir
  install -D -m 0755 toggldesktop.bin $pkgdir/usr/bin/toggldesktop
}
