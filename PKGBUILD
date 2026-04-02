# Maintainer: Mirh <mirh@protonmail.ch>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wine-mono-git
_pkgname=wine-mono
pkgver=11.0.0
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework"
arch=('i686' 'x86_64')
url="https://gitlab.winehq.org/wine/wine/-/wikis/Wine-Mono"
license=(GPL LGPL2 MPL)
conflicts=('wine-mono')
depends=('wine')
makedepends=(libgdiplus mono bc)
options=(!lto)
source=(git+https://github.com/wine-mono/wine-mono.git
        git+https://github.com/wine-mono/FNA.git
        git+https://github.com/wine-mono/FNA.NetStub.git
        git+https://github.com/wine-mono/mono.git
        git+https://github.com/wine-mono/mono-basic-compat.git
        git+https://github.com/wine-mono/monoDX.git
        git+https://github.com/wine-mono/monolite-binaries.git
        git+https://github.com/wine-mono/wine-mono-vstests.git
        git+https://github.com/wine-mono/winforms.git
        git+https://github.com/wine-mono/winforms-datavisualization.git
        git+https://github.com/wine-mono/wpf.git

        git+https://github.com/FNA-XNA/FAudio.git
        git+https://github.com/FNA-XNA/FNA3D.git
        git+https://github.com/flibitijibibo/SDL2-CS.git
        git+https://github.com/flibitijibibo/SDL3-CS.git
        git+https://github.com/FNA-XNA/Theorafile.git
        git+https://github.com/MoonsideGames/dav1dfile.git
        git+https://github.com/icculus/mojoshader.git

        git+https://github.com/mono/Newtonsoft.Json.git
        git+https://gitlab.winehq.org/mono/api-doc-tools.git
        git+https://github.com/mono/api-snapshot.git
        git+https://github.com/mono/aspnetwebstack.git
        git+https://gitlab.winehq.org/mono/bdwgc.git
        git+https://github.com/wine-mono/reference-assemblies.git
        git+https://github.com/mono/bockbuild.git
        git+https://gitlab.winehq.org/mono/boringssl.git
        git+https://github.com/mono/cecil.git
        git+https://gitlab.winehq.org/mono/corefx.git
        git+https://github.com/mono/corert.git
        git+https://github.com/mono/ikdasm.git
        git+https://github.com/mono/ikvm-fork.git
        git+https://github.com/mono/illinker-test-assets.git
        git+https://github.com/mono/linker.git
        git+https://github.com/dotnet/llvm-project.git
        git+https://github.com/mono/NuGet.BuildTasks
        git+https://gitlab.winehq.org/mono/NUnitLite.git
        git+https://github.com/mono/roslyn-binaries.git
        git+https://github.com/mono/rx.git
        git+https://github.com/mono/xunit-binaries.git

        git+https://github.com/mono/Lucene.Net.Light.git
        git+https://github.com/icsharpcode/SharpZipLib.git
        git+https://github.com/Unity-Technologies/libatomic_ops.git

)
sha512sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | cut -f3 -d"-"
}

prepare() {
#thanks so much to nlgranger's submodules script
#TODO: figure why folder never get populated anymore if prepare fails once

  cd "${_pkgname}"
  git submodule init
  git config submodule.FNA.url "$srcdir"/FNA
  git config submodule.FNA.NetStub.url "$srcdir"/FNA.NetStub
  git config submodule.mono.url "$srcdir"/mono
  git config submodule.mono-basic-compat.url "$srcdir"/mono-basic-compat
  git config submodule.monoDX.url "$srcdir"/monoDX
  git config submodule.monolite.url "$srcdir"/monolite-binaries
  git config submodule.vstests.url "$srcdir"/wine-mono-vstests
  git config submodule.winforms.url "$srcdir"/winforms
  git config submodule.winforms-datavisualization.url "$srcdir"/winforms-datavisualization
  git config submodule.wpf.url "$srcdir"/wpf
  git -c protocol.file.allow=always submodule update

  cd FNA
  git submodule init
  git config submodule.lib/FAudio.url "$srcdir"/FAudio
  git config submodule.lib/FNA3D.url "$srcdir"/FNA3D
  git config submodule.lib/SDL2-CS.url "$srcdir"/SDL2-CS
  git config submodule.lib/SDL3-CS.url "$srcdir"/SDL3-CS
  git config submodule.lib/Theorafile.url "$srcdir"/Theorafile
  git config submodule.lib/dav1dfile.url "$srcdir"/dav1dfile
  git -c protocol.file.allow=always submodule update

  cd lib/FNA3D
  git submodule init
  git config submodule.MojoShader.url "$srcdir"/mojoshader
  git -c protocol.file.allow=always submodule update

  cd ../../../mono
  git submodule init
  git config submodule.external/Newtonsoft.Json.url "$srcdir/Newtonsoft.Json"
  git config submodule.external/api-doc-tools.url "$srcdir/api-doc-tools"
  git config submodule.external/api-snapshot.url "$srcdir/api-snapshot"
  git config submodule.external/aspnetwebstack.url "$srcdir/aspnetwebstack"
  git config submodule.external/bdwgc.url "$srcdir/bdwgc"
  git config submodule.external/reference-assemblies.url "$srcdir/reference-assemblies"
  git config submodule.external/bockbuild.url "$srcdir/bockbuild"
  git config submodule.external/boringssl.url "$srcdir/boringssl"
  git config submodule.external/cecil.url "$srcdir/cecil"
  git config submodule.external/cecil-legacy.url "$srcdir/cecil"
  git config submodule.external/corefx.url "$srcdir/corefx"
  git config submodule.external/corert.url "$srcdir/corert"
  git config submodule.external/ikdasm.url "$srcdir/ikdasm"
  git config submodule.external/ikvm.url "$srcdir/ikvm-fork"
  git config submodule.external/illinker-test-assets.url "$srcdir/illinker-test-assets"
  git config submodule.external/linker.url "$srcdir/linker"
  git config submodule.external/llvm-project.url "$srcdir/llvm-project"
  git config submodule.external/nuget-buildtasks.url "$srcdir/NuGet.BuildTasks"
  git config submodule.external/nunit-lite.url "$srcdir/NUnitLite"
  git config submodule.external/roslyn-binaries.url "$srcdir/roslyn-binaries"
  git config submodule.external/rx.url "$srcdir/rx"
  git config submodule.external/xunit-binaries.url "$srcdir/xunit-binaries"
  git -c protocol.file.allow=always submodule update

  cd external/api-doc-tools
  git submodule init
  git config submodule.external/Lucene.Net.Light.url "$srcdir/Lucene.Net.Light"
  git config submodule.external/SharpZipLib.url "$srcdir/SharpZipLib"
  git -c protocol.file.allow=always submodule update

  cd ../bdwgc
  git submodule init
  git config submodule.libatomic_ops.url "$srcdir"/libatomic_ops
  git -c protocol.file.allow=always submodule update

  cd ../linker
  git submodule init
  git config submodule.cecil.url "$srcdir"/cecil
  git -c protocol.file.allow=always submodule update

}


build() {
  cd "$srcdir/${_pkgname}"
  make image

  #TODO: switch off AUTO_LLVM_MINGW and use llvm-mingw from AUR?
}

package () {
  install -d -m755 "${pkgdir}/usr/share/wine/mono/${_pkgname}-${pkgver}"
  cd "${pkgdir}/usr/share/wine/mono/${_pkgname}-${pkgver}"

  cp -r -a --no-preserve='ownership' "$srcdir/${_pkgname}/image/." .
# either this or building the bin and then extracting it again
# (which could then be inconvenient if one easily *wanted* debug symbols)
  find -type f -iname "*.pdb" -delete
}
