# Maintainer: Zeta <z@gonzaleza.cr>
pkgname=('firma-digital-agente-gaudi' 'firma-digital-middleware-idopte' 'firma-digital-certificados-bccr' 'firma-digital-middleware-smartcard')
pkgver=Rev26_02
pkgbase=firma-digital
pkgrel=3
epoch=1
pkgdesc="Instalador de suite para Firma Digital de Costa Rica"
arch=(x86_64)
url="https://soportefirmadigital.com/sfdj/dl.aspx"
license=('MIT' 'unknown' 'unknown')
depends=()
makedepends=()
options=("!strip")
source=("local://sfd_ClientesLinux_RPM64_rev26_02.zip" "local://idocachesrv.service")
noextract=()
sha256sums=('6b034f1d2c8411ed665c3ca0dffea852fa6bd9097be5e1d48762927655b7eda5'
            '463db4a2c758e42702373771fe96b7d84c7eb3668b3b220218ce429f6670cd8a')

build() {
    bsdtar -xf "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Idopte/scmiddleware-costa-rica-user_idopte_6.23.44.0_rh9_amd64.rpm" -C "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Idopte"
    bsdtar -xf "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Agente GAUDI/agente-gaudi_27.0_amd64.rpm" -C "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Agente GAUDI"
}

package_firma-digital-certificados-bccr() {
    pkgdesc="Certificados del BCCR para Firma Digital de Costa Rica"
    depends=("p11-kit" "pcsclite")
    install=certificados.install
    certs=(
        "CA Certificado firma de codigo.cer"
        "CA POLITICA PERSONA FISICA - COSTA RICA v2(1).crt"
        "CA POLITICA PERSONA FISICA - COSTA RICA v2.crt"
        "CA POLITICA PERSONA JURIDICA - COSTA RICA v2(1).crt"
        "CA POLITICA PERSONA JURIDICA - COSTA RICA v2.crt"
        "CA POLITICA SELLADO DE TIEMPO - COSTA RICA v2(1).crt"
        "CA POLITICA SELLADO DE TIEMPO - COSTA RICA v2.crt"
        "CA RAIZ NACIONAL - COSTA RICA v2.crt"
        "CA SINPE - PERSONA FISICA v2(1).crt"
        "CA SINPE - PERSONA FISICA v2(2).crt"
        "CA SINPE - PERSONA FISICA v2(3).crt"
        "CA SINPE - PERSONA JURIDICA v2(1).crt"
        "CA SINPE - PERSONA JURIDICA v2(2).crt"
        "CA SINPE - PERSONA JURIDICA v2(3).crt"
        "Certificado firma de codigo (2025-02).cer"
        "Certificado-FirmaDeCodigo-BCCR-2026-2027.cer"
        "Certificado Firma de codigo BCCR.cer"
        "GlobalSign Root CA - R3.cer"
        "Raiz Certificado firma de codigo.cer"
    )

    msg "Installing certificates"
    for cert in "${certs[@]}"; do
        msg2 "Installing $cert"
        install -Dm644 "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Certificados/${cert}" "${pkgdir}/etc/ca-certificates/trust-source/anchors/${cert}" 
    done
}

package_firma-digital-agente-gaudi() {
    provides=("Agente-GAUDI")
    pkgdesc="Agente GAUDI para Firma Digital de Costa Rica"
    install -d "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Agente GAUDI/opt" "${pkgdir}/opt" 2> >(read err; error "$err")
    cp -r "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Agente GAUDI/opt/"* "${pkgdir}/opt/" 2> >(read err; error "$err")
    install -d "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Agente GAUDI/usr" "${pkgdir}/usr" 2> >(read err; error "$err")
    cp -r "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Agente GAUDI/usr/"* "${pkgdir}/usr/" 2> >(read err; error "$err") 

    mkdir -p "${pkgdir}/usr/share/applications/"
    ln -s "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Agente GAUDI/opt/Agente-GAUDI/lib/Agente-GAUDI.desktop" "${pkgdir}/usr/share/applications/Agente-GAUDI.desktop"
}

package_firma-digital-middleware-idopte() {
    pkgdesc="Middleware PKCS#11 Idopte para Firma Digital de Costa Rica"
    depends=("aom" "at-spi2-core" "brotli" "bzip2" "cairo" "dav1d" "dbus" "e2fsprogs" "enchant" "expat" "fontconfig" "freetype2" "fribidi" "gdk-pixbuf2" "glib2" "glycin" "graphite" "gst-plugins-base-libs" "gstreamer" "gtk3" "harfbuzz" "harfbuzz-icu" "hidapi" "highway" "hyphen" "icu" "json-glib" "keyutils" "krb5" "lcms2" "libatomic" "libavif" "libcloudproviders" "libdatrie" "libdrm" "libelf" "libepoxy" "libevdev" "libffi" "libgcc" "libgcrypt" "libglvnd" "libgpg-error" "libgudev" "libidn2" "libjpeg-turbo" "libjxl" "libmanette" "libnotify" "libpng" "libpsl" "libseccomp" "libsecret" "libsoup" "libstdc++" "libtasn1" "libthai" "libunistring" "libunwind" "libwebp" "libx11" "libxau" "libxcb" "libxcomposite" "libxcursor" "libxdamage" "libxdmcp" "libxext" "libxfixes" "libxi" "libxinerama" "libxkbcommon" "libxml2" "libxrandr" "libxrender" "libxslt" "libyuv" "mesa" "openssl" "orc" "pango" "pcre2" "pcsclite" "pixman" "rav1e" "sqlite" "svt-av1" "systemd-libs" "tinysparql" "tpm2-tss" "util-linux-libs" "wayland" "webkit2gtk" "woff2" "xz" "zlib" "zstd")
    provides=(
        "idocachesrv"
        "legacy.so"
        "libcrypto.so.3"
        "libidolog.so"
        "libidop11.so"
        "libssl.so.3"
        "libt_ias.so"
        "SCManager"
    )
    conflicts=()

    msg "Installing Idopte middleware"

    install -d "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Idopte/usr" "${pkgdir}/usr" 2> >(read err; error "$err")
    cp -r "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Idopte/usr/"* "${pkgdir}/usr/" 2> >(read err; error "$err") 

    install -d "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Idopte/etc" "${pkgdir}/etc" 2> >(read err; error "$err")
    cp -r "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Idopte/etc/"* "${pkgdir}/etc/" 2> >(read err; error "$err") 

    install -Dm644 "${srcdir}/idocachesrv.service" "${pkgdir}/usr/lib/systemd/system/idocachesrv.service"

}

package_firma-digital-middleware-smartcard() {
    depends=("pcsclite")
    pkgdesc="Middleware PKCS#11 Smart Card para Firma Digital de Costa Rica"
    provides=("libASEP11.so" "libaseLaserP11.so")

    mkdir -p "${pkgdir}/opt/sinpe-smartcard/lib"
    msg "Installing"
    for item in "${provides[@]}"; do
        msg2 "Installing $item"
        install -Dm755 "${srcdir}/sfd_ClientesLinux_RPM64_26_02/Firma Digital/Librería/${item}" "${pkgdir}/opt/sinpe-smartcard/lib/${item}"
    done

    msg "Creating firma digital module"
    mkdir -p "${pkgdir}/usr/share/p11-kit/modules/"
    echo -n 'module: /usr/lib/SCMiddleware/libidop11.so' > "${pkgdir}/usr/share/p11-kit/modules/firma-digital-sinpe-smartcard.module"
}
