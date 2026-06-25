# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ddnsto-bin
pkgname=(ddnsto-bin ddnsto-lite-bin)
_name=${pkgname%-bin}
pkgver=4.2.2
pkgrel=1
pkgdesc="DDNSTO is a stable, fast and easy-to-use intranet penetration tool"
arch=(
    x86_64
    aarch64
    armv7h
    mipsel
)
url="https://web.ddnsto.com"
license=('LicenseRef-ddnsto')
depends=()
makedepends=()
optdepends=()
source=(
    "https://fw0.koolcenter.com/binary/ddnsto/linux-binary/${_name}-standard-${pkgver}.tar.gz"
    "https://fw0.koolcenter.com/binary/ddnsto/linux-binary/${_name}-lite-${pkgver}.tar.gz"
    "ddnsto.service"
    "ddnsto.tmpfiles"
    "ddnsto.sysusers"
    "ddnsto-bin.install"
    "ddnsto-lite-bin.install"
)
sha256sums=('5a76072663e38324c03408ef1900c112851eb821d592951d61d925436324695a'
            'd6a18ba629e1eab7cad57f5399ef89ad875183a19d24a145529bfb84a27079c9'
            '99d7c3c20776645a08de44062cea1b32fd37288e35d61821e90c45e132dd5f14'
            '57f54bcf6013b0a2fe03923d4119a36cb8c6584f70b07dbd6d0c1d31f4fe8d72'
            'b068dcd630d7ce9a3b0bf904340f9438572d84cd4c75ad49102a274a4be37dd6'
            '113b1efa3502b9a62272cdf3f747f9ef39f452829e9f079b3975086d233f25aa'
            '113b1efa3502b9a62272cdf3f747f9ef39f452829e9f079b3975086d233f25aa')
options=(!debug !strip emptydirs)

package_ddnsto-bin() {
    pkgdesc+=" - Go"
    provides=(${pkgbase%-bin})
    conflicts=(${pkgbase%-bin})
    backup=('etc/ddnsto/config.yaml')
    install=${pkgname}.install

    cd "${srcdir}/${_name}-standard-${pkgver}/"
    if [ ${CARCH} = "x86_64" ]; then
        ./${_name}.x86_64 example-config > config.yaml
        install -vDm755 ${_name}.x86_64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "aarch64" ]; then
        ./${_name}.aarch64 example-config > config.yaml
        install -vDm755 ${_name}.aarch64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "mipsel" ]; then
        ./${_name}.mipsel example-config > config.yaml
        install -vDm755 ${_name}.mipsel ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "armv7h" ]; then
        ./${_name}.arm example-config > config.yaml
        install -vDm755 ${_name}.arm ${pkgdir}/usr/bin/${_name}
    fi
  
    sed -i -e 's|/tmp/logs|/var/log/ddnsto|g' \
        -e 's|/data|/srv/ddnsto|g' \
        config.yaml
    
    install -vDm640 config.yaml -t ${pkgdir}/etc/ddnsto/
    install -vDm644 ${srcdir}/ddnsto.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/var/log/ddnsto \
            ${pkgdir}/var/lib/ddnsto

    install -vdm775 ${pkgdir}/srv/ddnsto

    install -Dvm644 "${srcdir}/ddnsto.sysusers" "${pkgdir}/usr/lib/sysusers.d/ddnsto.conf"
    install -Dvm644 "${srcdir}/ddnsto.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ddnsto.conf"
}

package_ddnsto-lite-bin() {
    pkgdesc+=" - Zig"
    provides=(${pkgbase%-bin})
    conflicts=(${pkgbase%-bin})
    backup=('etc/ddnsto/config.yaml')
    install=${pkgname}.install

    cd "${srcdir}/${_name}-lite-${pkgver}/"
    if [ ${CARCH} = "x86_64" ]; then
        ./${_name}.x86_64 example-config > config.yaml
        install -vDm755 ${_name}.x86_64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "aarch64" ]; then
        ./${_name}.aarch64 example-config > config.yaml
        install -vDm755 ${_name}.aarch64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "mipsel" ]; then
        ./${_name}.mipsel example-config > config.yaml
        install -vDm755 ${_name}.mipsel ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "armv7h" ]; then
        ./${_name}.arm example-config > config.yaml
        install -vDm755 ${_name}.arm ${pkgdir}/usr/bin/${_name}
    fi
  
    sed -i -e 's|/tmp/logs|/var/log/ddnsto|g' \
        -e 's|/data|/srv/ddnsto|g' \
        config.yaml
    
    install -vDm640 config.yaml -t ${pkgdir}/etc/ddnsto/
    install -vDm644 ${srcdir}/ddnsto.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/var/log/ddnsto \
            ${pkgdir}/var/lib/ddnsto

    install -vdm775 ${pkgdir}/srv/ddnsto

    install -Dvm644 "${srcdir}/ddnsto.sysusers" "${pkgdir}/usr/lib/sysusers.d/ddnsto.conf"
    install -Dvm644 "${srcdir}/ddnsto.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ddnsto.conf"
}
