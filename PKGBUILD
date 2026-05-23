# Maintainer: knoelli

pkgname=adguard-cli-nightly-bin
pkgver=1.4.9
_pkgstatus='nightly'
pkgrel=2
pkgdesc='Tool to protect against ads, trackers and malicious websites'
arch=('x86_64')
url='https://github.com/AdguardTeam/AdGuardCLI'
options=('!strip')
install='adguard-cli.install'
conflicts=('adguard-cli-bin')

_file="adguard-cli"
_file1="adguard_root_helper"
_file2="certutil"
_file3="adguard_cli_nm"
_full_name="${_file}-${pkgver}-linux-${arch}"

source=(
	"https://github.com/AdguardTeam/AdGuardCLI/releases/download/v${pkgver}-${_pkgstatus}/${_full_name}.tar.gz"
)
sha256sums=('de9ff42cacdd1b7527bb84b89bf668336fc0bc6f6266ac7a2cf944dce8cd6b8f')

package() {
    cd "${srcdir}/${_full_name}"
    install -Dp "${_file}" "${pkgdir}/usr/share/${_file}/${_file}"
    install -Dp "${_file1}" "${pkgdir}/usr/share/${_file}/${_file1}"
    install -Dp "${_file2}" "${pkgdir}/usr/share/${_file}/${_file2}"
    install -Dp "${_file3}" "${pkgdir}/usr/share/${_file}/${_file3}"
    install -D -m644 "${_file}.sig" "${pkgdir}/usr/share/${_file}/${_file}.sig"
    install -D -m644 "${_file1}.sig" "${pkgdir}/usr/share/${_file}/${_file1}.sig"
    install -D -m644 "${_file2}.sig" "${pkgdir}/usr/share/${_file}/${_file2}.sig"
    install -D -m644 "${_file3}.sig" "${pkgdir}/usr/share/${_file}/${_file3}.sig"
    install -D "bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/${_file}.sh"
    install -D "install_cert.sh" "${pkgdir}/usr/share/${_file}/install_cert.sh"
    install -D "defaults.zip" "${pkgdir}/usr/share/${_file}/defaults.zip"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/share/${_file}/${_file} "${pkgdir}/usr/bin/${_file}"
    ln -s /usr/share/${_file}/${_file1} "${pkgdir}/usr/bin/${_file1}"
    ln -s /usr/share/${_file}/${_file2} "${pkgdir}/usr/bin/adguard-${_file2}"
    ln -s /usr/share/${_file}/${_file3} "${pkgdir}/usr/bin/${_file3}"
    ln -s /usr/share/${_file}/install_cert.sh "${pkgdir}/usr/bin/adguard-install_cert"
    ln -s /usr/share/${_file}/${_file}.sig "${pkgdir}/usr/bin/${_file}.sig"
    ln -s /usr/share/${_file}/${_file1}.sig "${pkgdir}/usr/bin/${_file1}.sig"
    ln -s /usr/share/${_file}/${_file3}.sig "${pkgdir}/usr/bin/${_file3}.sig"
    chmod u+s "${pkgdir}/usr/share/${_file}/${_file1}"
}
