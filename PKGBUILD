# Maintainer: Xianwen Chen <xianwen.chen@gmail.com>
# Contributors:
#  geosam
#  mafes

pkgname=geoda-bin
pkgver=1.18.0
pkgrel=13
pkgdesc='GeoDa is an Exploratory (Spatial) Data Analysis and Spatial Regression software, for spatial data analysis including spatial econometrics.'
arch=('x86_64')
license=('custom:free_for_non_commercial_use')
url="http://geodacenter.github.io/download_linux.html"
depends=('libcurl-gnutls')
makedepends=('wget' 'dpkg' 'rsync')
install=$pkgname.install
source=(
    "https://github.com/GeoDaCenter/geoda/releases/download/v1.18/geoda_1.18-1disco1_amd64.deb"
)


package()
{
        cd "$srcdir/"
        dpkg -X ../geoda_1.18-1disco1_amd64.deb ./

        find . -type d -exec chmod 755 {} \;

#       sed 's/$GEODA_HOME\/gdaldata/$HOME\/gdaldata/' <usr/bin/run_geoda.sh > usr/bin/geoda-2
#       sed '/chmod/d' <usr/bin/geoda-2 > usr/bin/geoda
        mv usr/bin/run_geoda.sh usr/bin/geoda
        chmod +x usr/bin/geoda
    sed -i 's/run_geoda.sh/geoda/g' usr/share/applications/GeoDa.desktop
#       rm usr/bin/run_geoda.sh
#       rm usr/bin/geoda-2

        install -d $pkgdir/usr
        rsync -aPv usr/ $pkgdir/usr
        chmod 666 $pkgdir/usr/local/geoda/cache.sqlite
}

sha512sums=('a476ebeeed45b80c8866912f5b28c29a3d9ea9c2a257f2f45114422fbc5471f4976cd2a7cbbf2a9805f7b72f68052ef042bf440e0a874a88ebb9452dfc441f90')
