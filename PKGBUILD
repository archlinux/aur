# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# Sorry for stealing your logo from Twitter BrashMonkey, but I couldn't find any in the archive...

_pkgname=spriter
pkgname=spriter-bin
pkgver=R11
_date=04-20-2017
pkgrel=1
pkgdesc="The Ultimate 2D Game Animation Solution."
arch=('x86_64' 'i686')
url="https://brashmonkey.com/"
license=('custom')
depends=('gstreamer0.10-base' 'libpng12')
# See http://www.brashmonkeygames.com/spriter/legacyVersions/ for new versions
source_x86_64=("http://www.brashmonkeygames.com/spriter/legacyVersions/${pkgver/R/r}_$_date/Spriter$pkgver(64).tar.gz")
source_i686=("http://www.brashmonkeygames.com/spriter/legacyVersions/${pkgver/R/r}_$_date/Spriter$pkgver(32).tar.gz")
source=("spriter.sh"
        "spriter.desktop"
        "spriter.png")
sha512sums=('79c93eea6603a28a952997310d6b1e7648eb7e1ca8764f4040ebd3e5b9d060a10363a769c812002e97156be0ed8e9c642c912aeebc0099d333125bbb671d9794'
            '94e876859a34c55eec1c72c51a1605a24b490710ebef60160703c03e831e71d9c971e8dad6c48068f7cd79184471d9f5b8a0a4780af27f5276e402e29ea388cb'
            'b0510be4417351d2ad0caaf93b91cb1a040358b8410979143d344b24047a4be601aa3d3f5d45446839cbb61595f5307a842ea78bb7326008155677ed0a6fcaf4')
sha512sums_x86_64=('c0f06e3b12ed2363899f2442a0a776f5afc2da6675934019bd24ea771a7350dedd23edaa657bda212fdb15ad7fed71c4318eb45261366ecaa103fd429fbd7ebd')
sha512sums_i686=('60fd5b318bf0c358e5f3e1eda78e4e67a290803463355e54fad484843c35a03b544794d0ec212bc52c343895216fa02c9215d3415326c73164e5904d7e569141')

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
