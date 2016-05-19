# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=humanresourcemachine
pkgver=2016.03.23
pkgrel=2
pkgdesc="Assembler programming puzzle game by the makers of WorldOfGoo - game sold separately"
url="http://tomorrowcorporation.com/humanresourcemachine"
arch=('i686' 'x86_64')
license=('custom')
depends=("sdl2" "openal")
source=("humblestore://HumanResourceMachine-Linux-2016-03-23.sh")
md5sums=('ac6013284194203c4732e713dcc0f543')
PKGEXT=.pkg.tar
DLAGENTS+=('humblestore://usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\". Game available from GOG or HumbleStore."; exit 1')

package() {
    if [[ $CARCH == 'i686' ]]
    then
        install -Dm755 "$srcdir/data/x86/HumanResourceMachine.bin.x86" "${pkgdir}/opt/humanresourcemachine/HumanResourceMachine.bin" 
        #cp -R "${srcdir}/data/x86/lib/"* "${pkgdir}/usr/lib/"
    elif [[ $CARCH == 'x86_64' ]]
    then
        install -Dm755 "$srcdir/data/x86_64/HumanResourceMachine.bin.x86_64" "${pkgdir}/opt/humanresourcemachine/HumanResourceMachine.bin" 
        #cp -R "${srcdir}/data/x86_64/lib64/"* "${pkgdir}/usr/lib/"
    fi

    # copy files
    install -Dm644 "$srcdir/data/noarch/LICENSE.txt" "$pkgdir/usr/share/licenses/humanresourcemachine/LICENSE"
    install -Dm644 "$srcdir/data/noarch/README.linux" "$pkgdir/opt/humanresourcemachine/README"
    install -Dm644 "$srcdir/data/noarch/icon.png" "$pkgdir/opt/humanresourcemachine/icon.png"
    install -Dm644 "$srcdir/data/noarch/resource.pak" "$pkgdir/opt/humanresourcemachine/resource.pak"
    cp -R "$srcdir/data/noarch/shaders" "$pkgdir/opt/humanresourcemachine/"

    # starter script
    mkdir -p "${pkgdir}/usr/bin"
    cat >> "${pkgdir}/usr/bin/humanresourcemachine" << \here
#!/usr/bin/bash
cd /opt/humanresourcemachine
./HumanResourceMachine.bin
here
    chmod a+x "${pkgdir}/usr/bin/humanresourcemachine"
}
