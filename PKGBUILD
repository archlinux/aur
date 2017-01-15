# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# Sorry for stealing your logo from Twitter BrashMonkey, but I couldn't find any in the archive...

_pkgname=spriter
pkgname=spriter-bin
pkgver=R10
_date=12-22-2016
pkgrel=1
pkgdesc="The Ultimate 2D Game Animation Solution."
arch=('x86_64' 'i686')
url="https://brashmonkey.com/"
license=('custom')
depends=('')
# See http://www.brashmonkeygames.com/spriter/legacyVersions/ for new versions
source_x86_64=("http://www.brashmonkeygames.com/spriter/legacyVersions/${pkgver/R/r}_$_date/Spriter$pkgver(64).tar.gz")
source_i686=("http://www.brashmonkeygames.com/spriter/legacyVersions/${pkgver/R/r}_$_date/Spriter$pkgver(32).tar.gz")
source=("spriter.sh"
        "spriter.desktop"
        "spriter.png")
sha512sums=('0ec3e93b8f140e342a636a779bbac9d5fc808df1d5993530e84e979b11d1ef5d6c174082001c48b60734a2334705fa3169689ae208d0f50086dfcf0421d7966c'
            '94e876859a34c55eec1c72c51a1605a24b490710ebef60160703c03e831e71d9c971e8dad6c48068f7cd79184471d9f5b8a0a4780af27f5276e402e29ea388cb'
            'b0510be4417351d2ad0caaf93b91cb1a040358b8410979143d344b24047a4be601aa3d3f5d45446839cbb61595f5307a842ea78bb7326008155677ed0a6fcaf4')
sha512sums_x86_64=('b89a974c1b56774f1b4c525117b61d2a551466d07eb5d5454f7556b3899dc2a204dcad8ef98a7babf1100750d9053388f012d504ed39fb1b3c2c5212564cdbb8')
sha512sums_i686=('968065f748a9255aa679d0e17de495325f6c944cc77100d8b2f579eb3618c4885ba5a6ececb3917dd4c494c7e3d8222c39dc4db1562a702c2f6d9e83cd8393a7')

if [ "$CARCH" == "x86_64" ]; then
  ARCHDIR="Spriter$pkgver(64)"
else
  ARCHDIR="Spriter$pkgver(32)"
fi

package() {
  mkdir -p $pkgdir/opt/spriter
  cp -dr --no-preserve=ownership $srcdir/$ARCHDIR/* $pkgdir/opt/spriter

  # Wrong permissions on several files...
  # eg /opt/spriter/libsteam_api.so
  chmod -R +r $pkgdir/opt/spriter/

  # Startfile & desktop file
  install -Dm755 $srcdir/spriter.sh $pkgdir/usr/bin/spriter
  install -Dm644 $srcdir/spriter.desktop $pkgdir/usr/share/applications/spriter.desktop

  # License(s)
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mv $pkgdir/opt/spriter/{SpriterEULA.txt,ReadMeQtLGPL.txt} $pkgdir/usr/share/licenses/$pkgname/
  ln -s /usr/share/licenses/$pkgname/{SpriterEULA.txt,ReadMeQtLGPL.txt} $pkgdir/opt/spriter/

  # Icon for the application launcher
  install -Dm644 $srcdir/spriter.png $pkgdir/usr/share/icons/spriter.png
}

# vim:set ts=8 sts=2 sw=2 et:
