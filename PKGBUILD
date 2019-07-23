#Maintainer: Gharim Turen <gharim@turen.de>
pkgname=evesetup
pkgver=1533874
pkgrel=4
pkgdesc="An inofficial EVE Online Launcher Setup Tool."
arch=(x86_64)
url="https://forums.eveonline.com/t/eve-installing/71494"
license=('custom')

depends=('icu'
         'openssl'
         'openssl-1.0'
         'qt5-base'
         'qt5-declarative'
         'qt5-translations'
         'qt5-location'
         'qt5-webchannel'
         'qt5-webengine'
         'qt5-websockets'
         'wine'
         'winetricks')

optdepends=('libnotify')

conflicts=('evelauncher' 'evesetup_dev')

source=("evelauncher.desktop"
        "evelauncher.sh"
        "evelauncher.sh.in"
        "evelauncher.sh.real"
        "evelauncher.shlib"
        "everegedit.desktop"
        "evewine"
        "evewinecfg.desktop"
        "evewinetricks.desktop"
        "evewinetricks"
        "evebackup.desktop"
        "evebackup"
        "qt.conf"
        "build_installer.sh"
        "setup.sh.in"
        "eve-icons.tar.gz"
        "eve-icons_large.tar.gz"
        "eve-transl5.11-de.tar.gz"
        "eve-transl5.11-en.tar.gz"
        "eve-transl5.11-fr.tar.gz"
        "eve-transl5.11-ja.tar.gz"
        "eve-transl5.11-ru.tar.gz"
        "eve-transl5.11-zh.tar.gz"
        "https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run"
        "https://binaries.eveonline.com/evelauncher-${pkgver}.tar.gz")

noextract=('eve-transl5.11-de.tar.gz'
           'eve-transl5.11-en.tar.gz'
           'eve-transl5.11-fr.tar.gz'
           'eve-transl5.11-ja.tar.gz'
           'eve-transl5.11-ru.tar.gz'
           'eve-transl5.11-zh.tar.gz'
           'https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run')

package() {
        install -d "${pkgdir}/opt/${pkgname}/bin"
        install -d "${pkgdir}/opt/${pkgname}/lib"
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/usr/share/applications"
        install -d "${pkgdir}/usr/share/icons"
        for cmd in evelauncher.sh everegedit evewine evewinecfg evewinetricks evebackup ;do
            if [ -f "${srcdir}/$cmd" ] ;then
                install "${srcdir}/$cmd" "${pkgdir}/opt/${pkgname}/bin"
            else
                ln -s evewine "${pkgdir}/opt/${pkgname}/bin/$cmd"
            fi
            ln -s "/opt/${pkgname}/bin/$cmd" "${pkgdir}/usr/bin/$cmd"
            if [ ! "$cmd" = "evewine" ] ;then
                cp "${srcdir}/${cmd%.*}.desktop" "${pkgdir}/usr/share/applications/"
            fi
        done
        sed -i s,ELVER=\"\",ELVER=\"${pkgver}\", "${pkgdir}/opt/${pkgname}/bin/evelauncher.sh"
        cp ${srcdir}/evelauncher.shlib ${pkgdir}/opt/${pkgname}/lib
        cp -r ${srcdir}/icons ${pkgdir}/usr/share/
        rm -rf ${srcdir}/evelauncher/resources/ ${srcdir}/evelauncher/plugins/
        rm -f ${srcdir}/evelauncher/*Qt* ${srcdir}/evelauncher/libcrypto*
        rm -f ${srcdir}/evelauncher/libssl* ${srcdir}/evelauncher/libicu*
        rm -f ${srcdir}/evelauncher/libxcb*
        cp -f ${srcdir}/evelauncher.sh.real ${srcdir}/evelauncher/evelauncher.sh
        chmod 0755 ${srcdir}/evelauncher/*
        chmod 0644 ${srcdir}/evelauncher/*.qm ${srcdir}/evelauncher/errorpage/*
        cp -pf ${srcdir}/qt.conf ${srcdir}/evelauncher
        ln -sf evelauncher.sh ${srcdir}/evelauncher/LogLite.sh
        ln -sf libgpr.so.6.0.0 ${srcdir}/evelauncher/libgpr.so
        ln -sf libgpr.so.6.0.0 ${srcdir}/evelauncher/libgpr.so.6
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so.1
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so.6
        ln -sf libgrpc.so.6.0.0 ${srcdir}/evelauncher/libgrpc.so
        ln -sf libgrpc.so.6.0.0 ${srcdir}/evelauncher/libgrpc.so.6
        ln -sf libprotobuf.so.16.0.0 ${srcdir}/evelauncher/libprotobuf.so
        ln -sf libprotobuf.so.16.0.0 ${srcdir}/evelauncher/libprotobuf.so.16
        ln -sf libpng12.so.0.54.0 ${srcdir}/evelauncher/libpng12.so.0
        find ${srcdir}/evelauncher/ -type f -exec strip -s {} 2>/dev/null \;
        tar cJf ${pkgdir}/opt/${pkgname}/lib/evelauncher-${pkgver}.tar.xz evelauncher/
}

sha256sums=('f49b404341e1dd48eaa2504c83f9ff07c9a4c11e1a109c67d04167dc70d65731'
            'ee89bb914f9c624e2d9031fa9694837f14a2ddf8d2cde4927bfedc4bfc427810'
            '63605574731c8eddf22e32c5ffd70c5fadf06b3995d6a8a464b8d7e5e1c802fa'
            '80fceef0e28c2291cd4ba3924410211edd188717be093ffc329d18697583bd21'
            'f772aaaf0a6951c87fa0d2bcc5f96966a81c7750940140404b001eaf42168f99'
            'f8988be390204ce645ca37f43cdb8e395970f8d6dd36095acf08c5c7cf72833c'
            '5eeb80f73627b2e240843f797995ad60c1ae52f9a9a61bb0653351746477e048'
            '04d2a47524cbd132aad2fd310d56515a29310a2e693ba94ce12c65cd776a70d2'
            '22690e393ee89703b17898038aaa37900805104e8c960b346fe1f6050edc9bce'
            'd5047d1648550c3e54672e6b16d2fa67a323d7affa9eae2b0db16b8ed20b7d90'
            'f34cef776c79cbd4e5b74d680f04c614c0698fd3a685b1c7cf39e4fed6519bcc'
            '3ec6892df9109260af05fb53c1e980741b7c1b6bf1927b9fc1b1a6253b901cca'
            '2520a9b19f2827fa2634ea2acae3a6f61e73aada1af0eb2029e95709f0c8927d'
            '94616333dd5c61b8ff44aba26dfabe69a8e8de8bb2fcdc9a10d0ee98a56b9907'
            '3891991a1b700b3d5a524dbeb5015fbe578baf1855066cf0cff89412df84342a'
            '2c192fdc282fefafee5596b60bd1779668b611d386e2bf933eef51d39eac7a28'
            'f88c7c28582b6531a021b8fcece47c906f900c48edf453dc04c349f8671cf8a2'
            '47accd49b64d624c6a6dee42952f8627aaabdd315fad85ef037507745d393f1a'
            '1c3df28324c8498e34d2e789fd1f36577afa5a31bdbb278d752f7ef8c6ec5516'
            'bb63c2ea31d204f4d8eb270848674ad898ed45bbf0a9cea480611581f1149e4f'
            'f78996a8b01463891e97270b8f9d9fa5a61ccf0710e1163aff0c0c49ce3849c3'
            '7ae1c6324c4ad43ab3f18f5a3ceaa48b34ede5466b7a0b9351d018e8cef9bbd0'
            '1936061a14432ab2632ea3ff15d45350b59ac822985445f597a4a5db44a35ae6'
            'ca66a6113ce98152b85c8d847949f8c90ab9ba798e106bfc225d4ed3c2e2e3e2'
            '2a7ff114e3961e69aeba77359e847f36b701c055bdf38c7455a4e4700c53d01d')
