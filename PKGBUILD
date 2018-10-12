#Maintainer: Gharim Turen <gharim@turen.de>
pkgname=evesetup
pkgver=1385477
pkgrel=1
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
         'winetricks'
)

optdepends=('libnotify')

conflicts=('evelauncher' 'evesetup_dev')

source=("evelauncher.desktop"
        "evelauncher.sh"
        "evelauncher.sh.real"
        "everegedit.desktop"
        "everegedit"
        "evewine"
        "evewinecfg.desktop"
        "evewinecfg"
        "evewinetricks.desktop"
        "evewinetricks"
        "qt.conf"
        "eve-icons.tar.gz"
        "https://binaries.eveonline.com/evelauncher-${pkgver}.tar.gz")

package() {
        install -d "${pkgdir}/opt/${pkgname}/bin"
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/usr/share/applications"
        for cmd in evelauncher.sh everegedit evewine evewinecfg evewinetricks ;do
            install "${srcdir}/$cmd" "${pkgdir}/opt/${pkgname}/bin"
            ln -s "/opt/${pkgname}/bin/$cmd" "${pkgdir}/usr/bin/$cmd"
            if [ ! "$cmd" = "evewine" ] ;then
                cp "${srcdir}/${cmd%.*}.desktop" "${pkgdir}/usr/share/applications/"
            fi
        done
        mkdir -p ${srcdir}/Launcher
        cp -r ${srcdir}/evelauncher/errorpage ${srcdir}/Launcher
        cp ${srcdir}/evelauncher/evelauncher* ${srcdir}/Launcher
        cp ${srcdir}/evelauncher/LogLite ${srcdir}/Launcher
        cp ${srcdir}/evelauncher/libg* ${srcdir}/Launcher
        cp ${srcdir}/evelauncher/libprotobuf.so.16.0.0 ${srcdir}/Launcher
        cp ${srcdir}/evelauncher/libsteam_api.so ${srcdir}/Launcher
        cp -f ${srcdir}/evelauncher.sh.real ${srcdir}/Launcher/evelauncher.sh
        ln -sf evelauncher.sh ${srcdir}/Launcher/LogLite.sh
        ln -sf libgpr.so.6.0.0 ${srcdir}/Launcher/libgpr.so
        ln -sf libgpr.so.6.0.0 ${srcdir}/Launcher/libgpr.so.6
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/Launcher/libgrpc++.so
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/Launcher/libgrpc++.so.1
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/Launcher/libgrpc++.so.6
        ln -sf libgrpc.so.6.0.0 ${srcdir}/Launcher/libgrpc.so
        ln -sf libgrpc.so.6.0.0 ${srcdir}/Launcher/libgrpc.so.6
        ln -sf libprotobuf.so.16.0.0 ${srcdir}/Launcher/libprotobuf.so
        ln -sf libprotobuf.so.16.0.0 ${srcdir}/Launcher/libprotobuf.so.16
        chmod 0755 ${srcdir}/Launcher/*
        chmod 0644 ${srcdir}/Launcher/*.qm
        cp ${srcdir}/qt.conf ${srcdir}/Launcher
        find ${srcdir}/Launcher -type f -exec strip -s {} 2>/dev/null \;
        tar cJf ${srcdir}/launcher-${pkgver}.tar.xz Launcher/
        install -d "${pkgdir}/opt/${pkgname}/lib"
        mv ${srcdir}/launcher-${pkgver}.tar.xz ${pkgdir}/opt/${pkgname}/lib
        install -d ${pkgdir}/usr/share/icons
        cp -r ${srcdir}/icons ${pkgdir}/usr/share
}

sha256sums=('f49b404341e1dd48eaa2504c83f9ff07c9a4c11e1a109c67d04167dc70d65731'
            'a55d3764d7f6783ca3133770ded7bde46c6be4421ab48c63f830aefb5cb07d2f'
            '4e33e44c46e160bdc924d2705be58454bdf67dd945c056b7ab509c90a60c1d9f'
            'f8988be390204ce645ca37f43cdb8e395970f8d6dd36095acf08c5c7cf72833c'
            '3b12085bc5250fde7a1ba6ddb63d77328fec6a3836413ec3cb687622bf962627'
            'b31f607fcb09b4182d1acc08aa4f8e7c2e24ed40f64ede7b08328191481daa60'
            '04d2a47524cbd132aad2fd310d56515a29310a2e693ba94ce12c65cd776a70d2'
            '71ea5a4aeac6604b241b60a3f8b3f9c28c4d252d2949aa95cf97abd9d969e16b'
            '22690e393ee89703b17898038aaa37900805104e8c960b346fe1f6050edc9bce'
            '31155670d9f40fb348c34dd252a20fb5cc4191a311906fb8bcb84cb534b3cee8'
            '2520a9b19f2827fa2634ea2acae3a6f61e73aada1af0eb2029e95709f0c8927d'
            '7804f7fe54823b8428452711b07b4e64fb753059e834263d0b985293ae505456'
            '75165be88772e6bfabb1b148402227161f0ed540494071032f203207fdcccc2b')
