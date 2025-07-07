# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://www.mathworks.com/help/install/ug/get-mpm-os-command-line.html

_releases=(R2017b R2018a R2018b R2019a R2019b R2020a R2020b R2021a R2021b
           R2022a R2022b R2023a R2023b R2024a R2024b)
_release=R2025a
_pkgver=2025.1
_commit="8d84924e79d5d0caa42892a2d4c85c0d3b3fdf87" # 2025.1

_name="mpm"
pkgname="matlab-${_name}"
pkgver="${_pkgver}+${_release}"
pkgrel=4
pkgdesc="MATLAB Package Manager"
arch=('x86_64')
url="https://www.mathworks.com/products/mpm.html"
_url="https://github.com/mathworks-ref-arch/matlab-dockerfile"
license=('custom:MATLAB EULA')
provides=("${pkgname}-release=${_release}")
depends=('ca-certificates' 'glibc' 'unzip')
_pkgsrc="${pkgname}-${_pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/${_commit}/MPM.md"
        "${pkgname}-${_release}-input.txt::${_url}/raw/refs/heads/main/mpm-input-files/${_release}/mpm_input_${_release,,}.txt")
source_x86_64=("${_pkgsrc}-x86_64::https://ssd.mathworks.com/supportfiles/downloads/${_name}/${_pkgver}/glnxa64/${_name}")
for _rel in "${_releases[@]}"; do
  source+=("${pkgname}-${_rel}-input.txt::${_url}/raw/refs/heads/main/mpm-input-files/${_rel}/mpm_input_${_rel,,}.txt")
done
sha256sums=('4f3c20204091db1fbc13d397af9dcdd8270735c91a3e464bf30c91757242233c'
            '731eb958645237f82428420753d2c831bf1ae426df3d591b3a84b276bced2051'
            '7374e437b623b6637a890355d45185588957912093bce380dc6ada79a06764c3'
            '4f2b64e6c62385a734924814a034377ddd751f578805c015bcb94a96e2ec69ce'
            '530adc6e23cf0254a16793d52911e39ed6372cfe4222af0d19b8e8ffcdb91026'
            'ef80fdb0619c7babbebade9b2407f62a742632f672099a3bc94fe32127e32c2b'
            '3efacd74f610f23695cb8b3570856fe6c5787d2d4e1e6839916eea3efc7bf87e'
            'd5de75da8a670f5ebc43bfd35ff8e64a547e17cc1ce90e9d704c5663623be354'
            'c8ceb2360e342f9df5462a0fcd8965df1c02318638dde9103f2bd14925664b0c'
            'd162c2dda752e87b31d4b661ea688ec81dafe279c4192634c76825f4f91a3f93'
            'd1d0719554d52abe104ca737e4b89298529c456e6f7373baaa2a9de9ee987fd3'
            '638a306a92ab93f598f970112af624cd73282eabe414427d02be511e3c6ac7b5'
            '75d7919736e14d18ee26f09dafbff8c79d7a3551d55c8d5b2fc12e6efdace9a0'
            'c00b7e6e8caede9786d9c00f30bcda46a24663ecbae67d8566084abc020ff695'
            '4e826bd110a808723651590efbd5629888603d1a9ee66e93e26b2161bf41c29e'
            '14cc941cd31d10e3af3bfd6fd75da619dff2c169fa4ce1aa771084bfc752071d'
            'a00dffa68014ae40af3a2731692411086c6b16f6447fd9282d33388e36a768bc')
sha256sums_x86_64=('09a430390e93919c95272b3178ebd29468d600791a6e1f2200c48bb25d675243')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  for _rel in "${_releases[@]}"; do
    install -vDm644 "${pkgname}-${_rel}-input.txt" "${pkgdir}/usr/share/${pkgname}/input/${_rel}.txt"
  done
  install -vDm644 "${pkgname}-${_release}-input.txt" "${pkgdir}/usr/share/${pkgname}/input/${_release}.txt"
  ln -vsf "/usr/share/${pkgname}/input/${_release}.txt" "${pkgdir}/usr/share/${pkgname}/input/latest.txt"

  ln -vsf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${_name}"
}
