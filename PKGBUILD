# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-preview-bin
pkgname=(
  dotnet-core-host-preview-bin
)
pkgver=8.0.0.sdk100+preview.1
_hostver=8.0.0-preview.1.23110.8
_dotnetruntimever=8.0.0-preview.1.23110.8
_aspnetruntimever=8.0.0-preview.1.23112.2
_sdkver=8.0.100-preview.1.23115.2
pkgrel=2
arch=(armv7h aarch64 x86_64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source=(dotnet.sh
        register-completions.bash
        register-completions.fish
        register-completions.zsh)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/1fb6d1b1-e976-4e94-9009-229ee313dfa5/5476a83dcda6d51617598cff9db793bd/dotnet-sdk-8.0.100-preview.1.23115.2-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/57c316ef-4b1d-4b1e-b180-f38302132d3d/b938e1b373897fadfb25ff4b55ca32e6/dotnet-sdk-8.0.100-preview.1.23115.2-linux-arm64.tar.gz)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/e2578737-231b-493c-a6ee-f181496fe679/18038808d2621094ebe172ca011a7c22/dotnet-sdk-8.0.100-preview.1.23115.2-linux-x64.tar.gz)
sha512sums=('e61b9e3e5a2305646a616d598378230c9755c5dd5363692cc363f8f4add3807563c324dd86f3a7ae9d358c82d730608e7b293935a2b6c81c0c0f62d752a0a1cf'
            '9f977e0bd12abc0dda4d914f369c58fce502b4030cf91d4248b32242d98fe5a2bbd8446502feeb914561f310dfd3c113bb6da19bfd5dfa6233109e62d22fa966'
            '1de3f09b96c44429b026277bb135a019b7577df2dec5f695ce51d18daefe2c1736b3359ab95f2abc46f7320c445b968e5582df92bb2bcad3ac5cfc5a32d3c5b6'
            'f2be62d9cce00357b7b18ae83b976841037830b7b9ed1b67445f76e02550c904be5ab023366441199f9bb3dfd602004b0334395ffdde6c313910c1da5c39c4a3')
sha512sums_armv7h=('b1d9f2bad2c00412c2efa1821e972df317fa6bb5e2eb51e34c871d10d20b8717ec48ddb2b10990fac50a056774d66b3444a8a459da418b1d70fb53d9e7277ba7')
sha512sums_aarch64=('98518887927605051312554499e197c14b32e8100fe8d8015a4556fdca3a347a3d2215d14069d33b27d978489f3e958c11baf18ba33e1b98580d2eb64cc1097b')
sha512sums_x86_64=('23a14c92e402161ed8d42ec9cb25a97868a1b72348195d28cffa00a12815f019308b56485e4375c0d0a33d9a683d83cc1e1a2a517eea44af8fb353171b6c3f64')

package_dotnet-core-host-preview-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview, binary)'
  depends=(glibc)
  provides=(dotnet-host dotnet-host=${_hostver%-*})
  conflicts=(dotnet-host)
  replaces=(dotnet-host-preview)

  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{dotnet,licenses/dotnet-host-preview-bin}}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-preview-bin
  ln -sf /usr/share/dotnet/dotnet "${pkgdir}"/usr/bin/dotnet
  ln -sf /usr/share/dotnet/host/fxr/"${_hostver}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
  install -Dm 644 "${srcdir}"/dotnet.sh -t "${pkgdir}"/etc/profile.d/
  install -Dm 644 "${srcdir}"/register-completions.bash "${pkgdir}"/usr/share/bash-completion/completions/dotnet
  install -Dm 644 "${srcdir}"/register-completions.fish "${pkgdir}"/usr/share/fish/vendor_completions.d/dotnet.fish
  install -Dm 644 "${srcdir}"/register-completions.zsh "${pkgdir}"/usr/share/zsh/site-functions/_dotnet
}
