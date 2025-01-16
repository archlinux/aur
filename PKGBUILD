# Maintainer: devome <evinedeng@hotmail.com>

_pkgname="stirling-pdf"
pkgname="${_pkgname}-bin"
pkgver=0.37.1
pkgrel=1
pkgdesc="Locally hosted web application that allows you to perform various operations on PDF files"
arch=("any")
url="https://github.com/Stirling-Tools/Stirling-PDF"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=("GPL-3.0-or-later")
backup=("etc/${_pkgname}/${_pkgname}.env")
depends=("java-runtime-headless>=17" "libreoffice-fresh" "ocrmypdf" "pngquant" "python-opencv" "tesseract-data-eng" "unoconv" "unpaper")
optdepends=("jbig2enc: for certain OCR functionality")
source=("${_pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}/Stirling-PDF-with-login.jar"
        "${_pkgname}.env"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('c1359180bbf8e8e3ce1ac33f60fe6dc859d0e6a95396b35ce797f5b93d490bf1'
            '21eb87b52d8502b10b339f9d2267530fcaa73f849317ad25102b6bd489ce9280'
            '4abb93db9f1f000ddb3d1f25dbda9f207a3f8fd8a783c264115271e36662e9f3'
            '0f8b3d727955536ae3ed98e8aeccb8f073e4c97c36a95de595624a71ea5fdd11'
            '554fbc114c32f4b81fe3b8199e936881e26b5649098c495acfd4cd77eefd2612')
noextract=("${_pkgname}-${pkgver}.jar")
_langs=(afr amh ara asm aze aze_cyrl bel ben bod bos bre bul cat ceb ces
        chi_sim chi_sim_vert chi_tra chi_tra_vert chr cos cym dan dan_frak deu deu_frak div dzo ell eng enm epo
        equ est eus fao fas fil fin fra frk frm fry gla gle glg grc guj hat heb
        hin hrv hun hye iku ind isl ita ita_old jav jpn jpn_vert kan kat kat_old kaz khm
        kir kmr kor kor_vert lao lat lav lit ltz mal mar mkd mlt mon mri msa
        mya nep nld nor oci ori osd pan pol por pus que ron rus san sin slk
        slk_frak slv snd spa spa_old sqi srp srp_latn sun swa swe syr tam tat
        tel tgk tgl tha tir ton tur uig ukr urd uzb uzb_cyrl vie yid yor)

for lang in ${_langs[@]}; do
    optdepends+=("tesseract-data-${lang}: for ${lang} language OCR")
done

package() {
    install -Dm644 "${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}.jar"
    install -Dm644 "${_pkgname}.env"           "${pkgdir}/etc/${_pkgname}/${_pkgname}.env"
    install -Dm644 "${_pkgname}.service"       "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers"      "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles"      "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
