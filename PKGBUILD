# MAINTAINER:   winlu <derwinlu AT gmail DOT com>

pkgname=soundsense
pkgver=43_187
pkgrel=3
pkgdesc="SoundSense is a sound-engine tool for Dwarf Fortress."
arch=("any")
url="http://df.zweistein.cz/soundsense/"
license=('custom')
depends=("java-environment" 
         "coreutils")
source=("http://df.zweistein.cz/soundsense/soundSense_$pkgver.zip"
        "soundsense_run")
md5sums=("b3dfea9716e7bdfe05ca2c0f44f582d8"
         "9584745318a6ae276feb72b08a1e35ef")

DEST="opt/soundsense/"

package() {
    mkdir -p ${pkgdir}/${DEST}
    mkdir -p ${pkgdir}/usr/bin/
    #fix line breaks
    mv $srcdir/$pkgname/soundSense.sh $srcdir/$pkgname/soundSense.sh.dos
    tr -d '\r' < $srcdir/$pkgname/soundSense.sh.dos > $srcdir/$pkgname/soundSense.sh
    rm $srcdir/$pkgname/soundSense.sh.dos
    #rm windows files
    rm $srcdir/$pkgname/*.cmd
    rm $srcdir/$pkgname/*.exe
    #rm sources zip
    rm $srcdir/$pkgname/soundSense_${pkgver}_source.zip
    #copy over and set permissions
    cp -r $srcdir/$pkgname/. ${pkgdir}/${DEST}
    chown :games -R ${pkgdir}/${DEST}
    find ${pkgdir}/${DEST}/ -type d -exec chmod 775 {} +
    find ${pkgdir}/${DEST}/ -type f -exec chmod 664 {} +
    find ${pkgdir}/${DEST}/ -type f -name "*.jar" -exec chmod 644 {} +
    chmod 755 ${pkgdir}/${DEST}/soundSense.sh
    #install soundsense script
    install -Dm755 $srcdir/soundsense_run $pkgdir/usr/bin/soundsense
}
