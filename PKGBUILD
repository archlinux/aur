# This PKGBUILD build trunk version of clangd, and may apply some non-standard patches
#
# Applying patches controls via enviroment variables:
#
# Toggle all below patches
# CLANGD_DEFAULT_PATCH_STATE:
#   'n' - disable all patches
#   'y' - apply all patches
#
# Apply user patches from `~/.config/clangd`. patches must have extension `*.patch`
# NOTE: This variable ignores the `CLANGD_DEFAULT_PATCH_STATE` variable
# CLANGD_USER_PATCHES:
#   'n' - disable all patches
#   'y' - apply all patches (default)
#
# Show Doxygen comments in hover (D134130)
# CLANGD_DOXYGEN:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve forwarded parameters in hover (D130265)
# CLANGD_RESOLVEFWDPARAMS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Implement textDocument/codeLens (D91930)
# It's also required patched `vscode-clangd` extension - https://github.com/lightmelodies/vscode-clangd/commit/46266b4adb106b5080f5c771099c777806a16adc
# CLANGD_CODELENS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Contextual postfix completions (D125224)
# Demo: https://asciinema.org/a/rxyoicX44ya2jLDpdbNj3rVcC
# CLANGD_POSTFIXCOMPLETION:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Extract Function: add hoisting support (D138499)
# CLANGD_EXTRACTFUNC:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add inlay hints for scructure paddings
# CLANGD_INLAYHINTSPADS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add hex formats in `size` and `offset` fileds on hover, when values more than 10
# CLANGD_HOVERINHEX:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show mask for bit fields (require CLANGD_HOVERBITFIELDS)
# CLANGD_HOVERBITFIELDSMASK:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show offset of virtual methods
# CLANGD_HOVERVIRTOFF:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show layout hover info everyhere
# CLANGD_HOVERLAYOUTEVERYHERE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Hide definition from hover info for functions and variables
# CLANGD_HOVERNODEFS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve includes in incomplete headers
# Limitations: AST for source must be loaded before open incomplete header
# CLANGD_RESOLVEINCHEADERS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add way to remove files from CDB via LSP
# No need in many cases. Useful only in multi project workspaces with patched client https://github.com/clangd/vscode-clangd/pull/487
# CLANGD_LSPREMOVEFROMCDB:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show total record (class/struct/union) paddings in hover
# CLANGD_HOVERRECORDPAD:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add tweak for implementing abstract class (D94942)
# CLANGD_IMPL_ABSTRACT_CLASS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Hover information: Show fields indexes in layout: `Offset: 8 bytes (index 1)`
# CLANGD_HOVERFIELDIDX:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Inlay hints: Ignore evident types in deduced types
# CLANGD_INLAYHINTSIGNOREEVIDENT:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Implement simple folding of preprocessor branches (PR: 80592)
# CLANGD_PREPROCESSOR_FOLDING:
#   'n' - do not apply this patch
#   'y' - apply this patch

: ${CLANGD_DEFAULT_PATCH_STATE:=n}
: ${CLANGD_USER_PATCHES:=y}
: ${CLANGD_DOXYGEN:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEFWDPARAMS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_CODELENS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_POSTFIXCOMPLETION:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_EXTRACTFUNC:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSPADS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERINHEX:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERBITFIELDSMASK:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERVIRTOFF:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERLAYOUTEVERYHERE:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERNODEFS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEINCHEADERS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_LSPREMOVEFROMCDB:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERRECORDPAD:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_IMPL_ABSTRACT_CLASS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERFIELDIDX:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSIGNOREEVIDENT:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_PREPROCESSOR_FOLDING:=$CLANGD_DEFAULT_PATCH_STATE}

pkgname=clangd-opt-git
pkgver=21.r9912.g2f08927fd5f4
pkgrel=1
pkgdesc='Trunk version of standalone clangd binary, with custom patches (look AUR page or PKGBUILD comments)'
arch=('x86_64')
url="https://llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses' 'patch'
    'libxml2' 'python-setuptools' 'python-psutil' 'python-sphinx' 'git')
depends=('gcc-libs' 'glibc' 'ncurses' 'zlib' 'zstd')
conflicts=('clangd-opt')
replaces=('clangd-opt')
provides=('clangd-opt')
options=('!strip' '!lto')
source=("git+https://github.com/llvm/llvm-project.git#branch=main"
    'hover-doxygen-trunk.patch'
    'doxygen-extra-render-trunk.patch'
    'doxygen-more-fields.patch'
    'hover-resolve-forward-params.patch'
    'lsp-codelens.patch'
    'postfix-completion-trunk.patch'
    'refactor-extract-function.patch'
    'inlay-hints-paddings.patch'
    'hover-hex-formats.patch'
    'hover-bit-fields-mask.patch'
    'hover-virt-offset.patch'
    'hover-layout-everyhere.patch'
    'hover-no-defs.patch'
    'resolve-incomplete-header-includes.patch'
    'lsp-remove-files-from-cdb.patch'
    'hover-record-paddings.patch'
    'implement-abstract-class.patch'
    'hover-field-idx.patch'
    'inlay-hints-hide-deduced-types-ignore-evident.patch'
    'lsp-preprocessor-folding.patch')
sha256sums=('SKIP'
    '3ffa0fc19bc7c91c9edbe02e466c3eb5522e5a4655440d408610311cee6db06d'  # hover-doxygen-trunk
    '614dd012009facb502a7d44e07fc819aa95383c8917537c57968f76ba7881a94'  # doxygen-extra-render-trunk
    'cf8c80466e6a264e0dfb3750ea7353aa2bb1044bffff381630cb008b95ef2ceb'  # doxygen-more-fields
    '9e5dd128cedc8f37724d9c39c0f8f7efc826b0fd367f3a03c2564ff9f514ced7'  # hover-resolve-forward-params
    '85cec3889f7a818fcc998c3564cdd9b01fbeb95855d64ea999d6df5af9ebe817'  # lsp-codelens
    '611c634082a70f120920d33bc0aaca79c7f3b74dadcda750de7b0a98766e1be5'  # postfix-completion-trunk
    'fd1f752f7a5a29bc18432ba60b0a9faa0381b3fee49febc53fc8f8f177d61f5d'  # refactor-extract-function
    'ad4b75468f2969e7414fb68670fb0ca622b0a1e19ca0fa7b836468f085fe0178'  # inlay-hints-paddings
    'ba47bb7ac05487a5a083094247eaa369f89404924172a4af40147507b15b90aa'  # hover-hex-formats
    'a91d05221bf464be15960bd6b5abedacd86289289032589637cfe915c4ba0000'  # hover-bit-fields-mask
    '1b1ad88faa83b36dd68f63851a0fd6e07eed16595fcbffdc8a57b5c884f8a98c'  # hover-virt-offset
    '62e38f3074f39d51524b3d43aabb3991df97e43ea4a8c20e8073c479a41d1057'  # hover-layout-everyhere
    '94b328ea81eb615a90acf18a9a78733d77093deb12203683510fe4881bad95c6'  # hover-no-defs
    '03ea8cac2b932c6657973cf11989a4e34a13958fc3957dfa3e62d44f5daa2a90'  # resolve-incomplete-header-includes
    '63e951edbafca684984c6878a7650570dc20021198622e627d374692b1b6e8eb'  # lsp-remove-files-from-cdb
    'd3e8d88d6bcc5c24cc28ce67bda144227d19fb740b50aec2ebdb7216de84fd47'  # hover-record-paddings
    '9dceaa36e551e13c4145b45baf694b04369ed525e34baa3b7f14c15f3e248e5f'  # implement-abstract-class
    '4531b804507d11e1918858551575fee81605dbac0617d7b22f335b10642e782d'  # hover-field-idx
    'ab61be8aae9e2e2f5bb090926912154fe14a77245dcd25aec5c0c447ee7a67ea'  # inlay-hints-hide-deduced-types-ignore-evident
    'f943364e9813eb65371f0bfb02251dbc4e5a293575dc5c4b7630dacbf0ded74b') # lsp-preprocessor-folding

pkgver() {
    cd llvm-project

    git describe --long --match llvmorg-\* | sed -r 's/llvmorg-([^-]*)-(init|rc[0-9]+)-(.*)/\1-r\3/;s/-/./g'
}

apply_patch() {
    echo -e "\033[0;34m  -> \033[1;37mApplying patch: $1\033[0m"
    patch -p1 -i ${srcdir}/$1.patch
}

prepare() {
    mkdir -p build
    cd ${srcdir}/llvm-project

    # Hover patches
    if [ "$CLANGD_DOXYGEN" != "n" ]; then
        apply_patch hover-doxygen-trunk
        apply_patch doxygen-extra-render-trunk
        apply_patch doxygen-more-fields
    fi
    if [ "$CLANGD_RESOLVEFWDPARAMS" != "n" ]; then
        apply_patch hover-resolve-forward-params
    fi
    if [ "$CLANGD_HOVERBITFIELDSMASK" != "n" ]; then
        apply_patch hover-bit-fields-mask
    fi
    if [ "$CLANGD_HOVERINHEX" != "n" ]; then
        apply_patch hover-hex-formats
    fi
    if [ "$CLANGD_HOVERVIRTOFF" != "n" ]; then
        apply_patch hover-virt-offset
    fi
    if [ "$CLANGD_HOVERLAYOUTEVERYHERE" != "n" ]; then
        apply_patch hover-layout-everyhere
    fi
    if [ "$CLANGD_HOVERNODEFS" != "n" ]; then
        apply_patch hover-no-defs
    fi
    if [ "$CLANGD_HOVERRECORDPAD" != "n" ]; then
        apply_patch hover-record-paddings
    fi
    if [ "$CLANGD_HOVERFIELDIDX" != "n" ]; then
        apply_patch hover-field-idx
    fi

    # LSP patches
    if [ "$CLANGD_CODELENS" != "n" ]; then
        apply_patch lsp-codelens
    fi
    if [ "$CLANGD_LSPREMOVEFROMCDB" != "n" ]; then
        apply_patch lsp-remove-files-from-cdb
    fi
    if [ "$CLANGD_PREPROCESSOR_FOLDING" != "n" ]; then
        apply_patch lsp-preprocessor-folding
    fi

    # Code-completion patches
    if [ "$CLANGD_POSTFIXCOMPLETION" != "n" ]; then
        apply_patch postfix-completion-trunk
    fi

    # Refactoring patches
    if [ "$CLANGD_EXTRACTFUNC" != "n" ]; then
        apply_patch refactor-extract-function
    fi
    if [ "$CLANGD_IMPL_ABSTRACT_CLASS" != "n" ]; then
        apply_patch implement-abstract-class
    fi

    # Inlay hints patches
    if [ "$CLANGD_INLAYHINTSPADS" != "n" ]; then
        apply_patch inlay-hints-paddings
    fi
    if [ "$CLANGD_INLAYHINTSIGNOREEVIDENT" != "n" ]; then
        apply_patch inlay-hints-hide-deduced-types-ignore-evident
    fi

    # Resolve patches
    if [ "$CLANGD_RESOLVEINCHEADERS" != "n" ]; then
        apply_patch resolve-incomplete-header-includes
    fi

    # User patches
    if [ "$CLANGD_USER_PATCHES" != "n" ]; then
        config_path=${XDG_CONFIG_HOME:-"$HOME/.config"}/clangd
        if [[ -d "$config_path" ]]; then
            echo -e "\e[1;32mSearch user pathces in \e[1;37m'${config_path}'\033[0m"
            patches=$(ls -1 "$config_path"/*.patch 2>/dev/null || true)

            if [[ -n $patches ]]; then
                for patch in ${patches[@]}; do
                    echo -e "\033[0;34m  -> \033[1;37mApplying user patch: $(basename ${patch%.patch})\033[0m"
                    patch -p1 -i "$patch"
                done
            else
                echo -e "\e[1;33mUser patches not found!\033[0m"
            fi
        fi
    fi
}

build() {
    cd build

    cmake -B . -S "${srcdir}/llvm-project/llvm" \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/opt/clangd \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra"
    cmake --build . --target clangd
}

package() {
    cd build

    cmake --install . --prefix "$pkgdir"/opt/clangd --component clangd --strip
    # Install headers
    mkdir "$pkgdir"/opt/clangd/lib
    cp -r lib/clang "$pkgdir"/opt/clangd/lib/clang
}
