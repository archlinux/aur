#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>

_dotnet_version=11.0
_system_dotnet=false

pkgname=watt-toolkit-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=3.1.0.r12.g4310f7287
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://steampp.net/"
license=('GPL-3.0-only')
depends=(
    # libe_sqlite3.so libHarfBuzzSharp.so libSkiaSharp.so
    'glibc'
    # libSkiaSharp.so
    'fontconfig' 'freetype2' 'expat' 'zlib' 'bzip2' 'libpng' 'harfbuzz' 'brotli' 'glib2' 'graphite' 'pcre2'
)
makedepends=('git')
optdepends=('steam: need official or flatpak version of steam')
provides=('steam++' 'watt-toolkit')
conflicts=('steam++' 'watt-toolkit')
options=('staticlibs' '!strip')
source=(
    'git+https://github.com/BeyondDimension/SteamTools'
    'git+https://github.com/BeyondDimension/Credentials-Public'
    'watt-toolkit.desktop'
    'set-cap.hook'
    '0001-fix-MsgPack.diff'
    '0002-fix-X509CertificatePackable-to-byte[].diff'
    'environment_check.sh'
    # Submodules
    'git+https://github.com/BeyondDimension/DirectoryPackages.git'
    'git+https://github.com/BeyondDimension/ArchiSteamFarm.git'
    'git+https://github.com/BeyondDimension/Avalonia.Image2.git'
    'git+https://github.com/BeyondDimension/Gameloop.Vdf.git'
    'git+https://github.com/BeyondDimension/Steam4NET.git'
    'git+https://github.com/BeyondDimension/Titanium-Web-Proxy.git'
    'git+https://github.com/BeyondDimension/SteamAchievementManager.git'
    'git+https://github.com/JustArchiNET/ASF-ui.git'
    'git+https://github.com/JustArchiNET/ArchiSteamFarm.wiki.git'
    'git+https://github.com/BeyondDimension/SteamClient.git'
    'git+https://github.com/quamotion/dotnet-packaging.git'
    'git+https://github.com/BeyondDimension/dotnetCampus.Ipc.git'
    'git+https://github.com/BeyondDimension/WTTS.MicroServices.ClientSDK.git'
    'git+https://github.com/BeyondDimension/Common.git'
    'git+https://github.com/BeyondDimension/WinAuth.git'
    'git+https://github.com/BeyondDimension/ValveKeyValue.git'
    'git+https://github.com/BeyondDimension/WTTS.Public.git'
    'git+https://github.com/BeyondDimension/Facepunch.Steamworks.git'
    'git+https://github.com/BeyondDimension/appcenter-sdk-dotnet.git'
    'git+https://github.com/reactiveui/Fusillade.git'
    'git+https://github.com/BeyondDimension/Avalonia8.git'
    'git+https://github.com/BeyondDimension/SteamKit.git'
    'git+https://github.com/steamdatabase/protobufs.git')
sha256sums=('SKIP'
            'SKIP'
            '971f095988215965ba7256158a2c23af8be27222ea4f50655acd6c3bf3c4a23a'
            'ee4c5a20eb3a44f9af37b67cc6b5f91e646ac8a35bb1b8be784413dad2ed34ea'
            '382f314cebeba3346c5d59344f72b0e05db6293e3a10185e3f5ceee0c73cbe81'
            'a822f7fb11aa94e7aed682f8f85272a820e20b3169c3856c9ddba6782e514743'
            'da96b337ef8f79f170fb5976dffee4c52ecf5bc842e3dac9d8479a198887b8b1'
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


declare -Ag _plugins=(
    #[BD.WTTS.Client.Plugins.Accelerator]=Accelerator
    #[BD.WTTS.Client.Plugins.Accelerator.ReverseProxy]=Accelerator.ReverseProxy
    #[BD.WTTS.Client.Plugins.Authenticator]=Authenticator
    #[BD.WTTS.Client.Plugins.GameAccount]=GameAccount
    #[BD.WTTS.Client.Plugins.GameList]=GameList
    #[BD.WTTS.Client.Plugins.GameTools]=GameTools
    #[BD.WTTS.Client.Plugins.SteamIdleCard]=SteamIdleCard
    #[BD.WTTS.Client.Plugins.ArchiSteamFarmPlus]=ArchiSteamFarmPlus
    #[BD.WTTS.Client.Plugins.SteamIdleCard]=SteamIdleCard
    #[BD.WTTS.Client.Plugins.Update]=Update
)

if "$_system_dotnet"
then
    depends+=("dotnet-runtime-$_dotnet_version" "aspnet-runtime-$_dotnet_version")
    makedepends+=("dotnet-sdk>=$_dotnet_version" "dotnet-targeting-pack-$_dotnet_version" "aspnet-targeting-pack-$_dotnet_version")
else
    makedepends+=('dotnet-install')
fi

prepare(){
    #https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
    git -C "${srcdir}/SteamTools" submodule init
    git -C "${srcdir}/SteamTools" config submodule."ref/DirectoryPackages".url              "file://${srcdir}/DirectoryPackages"
    git -C "${srcdir}/SteamTools" config submodule."ref/ArchiSteamFarm".url                 "file://${srcdir}/ArchiSteamFarm"
    git -C "${srcdir}/SteamTools" config submodule."ref/Avalonia.Image2".url                "file://${srcdir}/Avalonia.Image2"
    git -C "${srcdir}/SteamTools" config submodule."ref/Gameloop.Vdf".url                   "file://${srcdir}/Gameloop.Vdf"
    git -C "${srcdir}/SteamTools" config submodule."ref/Steam4NET".url                      "file://${srcdir}/Steam4NET"
    git -C "${srcdir}/SteamTools" config submodule."ref/Titanium-Web-Proxy".url             "file://${srcdir}/Titanium-Web-Proxy"
    git -C "${srcdir}/SteamTools" config submodule."ref/SteamAchievementManager".url        "file://${srcdir}/SteamAchievementManager"
    git -C "${srcdir}/SteamTools" config submodule."ref/SteamClient".url                    "file://${srcdir}/SteamClient"
    git -C "${srcdir}/SteamTools" config submodule."ref/dotnet-packaging".url               "file://${srcdir}/dotnet-packaging"
    git -C "${srcdir}/SteamTools" config submodule."ref/dotnetCampus.Ipc".url               "file://${srcdir}/dotnetCampus.Ipc"
    git -C "${srcdir}/SteamTools" config submodule."ref/WTTS.MicroServices.ClientSDK".url   "file://${srcdir}/WTTS.MicroServices.ClientSDK"
    git -C "${srcdir}/SteamTools" config submodule."ref/Common".url                         "file://${srcdir}/Common"
    git -C "${srcdir}/SteamTools" config submodule."ref/WinAuth".url                        "file://${srcdir}/WinAuth"
    git -C "${srcdir}/SteamTools" config submodule."ref/Facepunch.Steamworks".url           "file://${srcdir}/Facepunch.Steamworks"
    git -C "${srcdir}/SteamTools" config submodule."ref/appcenter-sdk-dotnet".url           "file://${srcdir}/appcenter-sdk-dotnet"
    git -C "${srcdir}/SteamTools" config submodule."ref/Fusillade".url                      "file://${srcdir}/Fusillade"
    git -C "${srcdir}/SteamTools" config submodule."ref/Avalonia8".url                      "file://${srcdir}/Avalonia8"
    git -C "${srcdir}/SteamTools" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/ArchiSteamFarm" submodule init
    git -C "${srcdir}/SteamTools/ref/ArchiSteamFarm" config submodule."ASF-ui".url  "file://${srcdir}/ASF-ui"
    git -C "${srcdir}/SteamTools/ref/ArchiSteamFarm" config submodule."wiki".url    "file://${srcdir}/ArchiSteamFarm.wiki"
    git -C "${srcdir}/SteamTools/ref/ArchiSteamFarm" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/Avalonia.Image2" submodule init
    git -C "${srcdir}/SteamTools/ref/Avalonia.Image2" config submodule."ref/DirectoryPackages".url "file://${srcdir}/DirectoryPackages"
    git -C "${srcdir}/SteamTools/ref/Avalonia.Image2" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/SteamClient" submodule init
    git -C "${srcdir}/SteamTools/ref/SteamClient" config submodule."ref/DirectoryPackages".url          "file://${srcdir}/DirectoryPackages"
    git -C "${srcdir}/SteamTools/ref/SteamClient" config submodule."ref/Gameloop.Vdf".url               "file://${srcdir}/Gameloop.Vdf"
    git -C "${srcdir}/SteamTools/ref/SteamClient" config submodule."ref/SteamAchievementManager".url    "file://${srcdir}/SteamAchievementManager"
    git -C "${srcdir}/SteamTools/ref/SteamClient" config submodule."ref/Steam4NET".url                  "file://${srcdir}/Steam4NET"
    git -C "${srcdir}/SteamTools/ref/SteamClient" config submodule."ref/ValveKeyValue".url              "file://${srcdir}/ValveKeyValue"
    git -C "${srcdir}/SteamTools/ref/SteamClient" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK" submodule init
    git -C "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK" config submodule."ref/DirectoryPackages".url "file://${srcdir}/DirectoryPackages"
    git -C "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK" config submodule."ref/WTTS.Public".url       "file://${srcdir}/WTTS.Public"
    git -C "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/Common" submodule init
    git -C "${srcdir}/SteamTools/ref/Common" config submodule."ref/DirectoryPackages".url "file://${srcdir}/DirectoryPackages"
    git -C "${srcdir}/SteamTools/ref/Common" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/WinAuth" submodule init
    git -C "${srcdir}/SteamTools/ref/WinAuth" config submodule."ref/DirectoryPackages".url "file://${srcdir}/DirectoryPackages"
    git -C "${srcdir}/SteamTools/ref/WinAuth" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/Avalonia8" submodule init
    git -C "${srcdir}/SteamTools/ref/Avalonia8" config submodule."ref/Common".url "file://${srcdir}/Common"
    git -C "${srcdir}/SteamTools/ref/Avalonia8" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK/ref/WTTS.Public" submodule init
    git -C "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK/ref/WTTS.Public" config submodule."ref/DirectoryPackages".url "file://${srcdir}/DirectoryPackages"
    git -C "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK/ref/WTTS.Public" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/Avalonia8/ref/Common" submodule init
    git -C "${srcdir}/SteamTools/ref/Avalonia8/ref/Common" config submodule."ref/SteamKit".url "file://${srcdir}/SteamKit"
    git -C "${srcdir}/SteamTools/ref/Avalonia8/ref/Common" -c protocol.file.allow=always submodule update

    git -C "${srcdir}/SteamTools/ref/Avalonia8/ref/Common/ref/SteamKit" submodule init
    git -C "${srcdir}/SteamTools/ref/Avalonia8/ref/Common/ref/SteamKit" config submodule."Resources/Protobufs".url "file://${srcdir}/protobufs"
    git -C "${srcdir}/SteamTools/ref/Avalonia8/ref/Common/ref/SteamKit" -c protocol.file.allow=always submodule update

    if ! "$_system_dotnet"
    then
        export DOTNET_ROOT="${srcdir}/dotnet-sdk"
        export PATH="$DOTNET_ROOT:$PATH"
        dotnet-install --channel "$_dotnet_version" --install-dir "${DOTNET_ROOT}" --no-path
    fi

    dotnet --info | grep RID | cut -d : -f 2 | sed 's/arch/linux/' | xargs > _platform
    local _platform
    _platform="$(< _platform)"
    cd "${srcdir}/SteamTools"
    # SteamTools/src/BD.WTTS.Client.Plugins.GameAccount/Models/PlatformSettings.cs(4,22): error MsgPack003: Type must be marked with MessagePackObjectAttribute: global::BD.WTTS.Models.PlatformSettings (https://github.com/MessagePack-CSharp/MessagePack-CSharp/blob/master/doc/analyzers/MsgPack003.md)
    # SteamTools/src/BD.WTTS.Client.Plugins.Accelerator/Settings/GameAcceleratorSettings.cs(34,49): error MsgPack004: Properties and fields of MessagePackObject-attributed types require either KeyAttribute or IgnoreMemberAttribute: global::BD.WTTS.Settings.GameAcceleratorSettings_.MyGames (https://github.com/MessagePack-CSharp/MessagePack-CSharp/blob/master/doc/analyzers/MsgPack004.md)
    patch -Np1 -i ../0001-fix-MsgPack.diff
    # SteamTools/src/BD.WTTS.Client.Plugins.Accelerator.ReverseProxy/Services/Certificate/ICertificateManager.cs(31,63): error CS1503: Argument 1: cannot convert from 'System.Runtime.Serialization.Formatters.X509CertificatePackable' to 'byte[]'
    patch -Np1 -i ../0002-fix-X509CertificatePackable-to-byte[].diff

    # error NU3012: Package 'Splat 19.3.1' from source 'https://api.nuget.org/v3/index.json': The author primary signature found a chain building issue: Revoked: certificate revoked
    export NUGET_CERT_REVOCATION_MODE=offline
    dotnet workload restore src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        -p:EnableWindowsTargeting=true
    dotnet restore src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        --runtime="$_platform"
    local _id
    for _id in "${!_plugins[@]}"
    do
        dotnet restore "src/${_id}/${_id}.csproj" --runtime="$_platform"
    done
}
pkgver(){
    cd "${srcdir}/SteamTools"
    git describe --tags --long | sed 's/-rc./.rc/;s/-/.r/;s/-/./g'
}
build(){
    cp -v "${srcdir}/Credentials-Public/"*.pfx "${srcdir}/SteamTools"

    _platform="$(< _platform)"
    cd "${srcdir}/SteamTools"

    if ! "$_system_dotnet"
    then
        export DOTNET_ROOT="${srcdir}/dotnet-sdk"
        export PATH="$DOTNET_ROOT:$PATH"
    fi

    echo "Building BD.WTTS.Client.Avalonia.App..."
    dotnet publish src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        -c Release --framework "net${_dotnet_version}" --runtime "${_platform}" --self-contained="$("$_system_dotnet" && echo false || echo true)"
    for _id in "${!_plugins[@]}"
    do
        echo "Building plugin ${_id}..."
        case "${_id}" in
            "BD.WTTS.Client.Plugins.Accelerator.ReverseProxy")
                dotnet publish "src/${_id}/${_id}.csproj" --no-restore -c Release --nologo -v q -p:WarningLevel=1 \
                    -p:PublishSingleFile=true --self-contained  --framework "net${_dotnet_version}" --runtime "${_platform}" \
                    -p:EnableWindowsTargeting=true -p:NoWarn=NU1605 -p:WarningsNotAsErrors=CS8604
                ;;
            *)
                dotnet publish "src/${_id}/${_id}.csproj" --no-restore -c Release --nologo -v q -p:WarningLevel=1 \
                    --self-contained="$("$_system_dotnet" && echo false || echo true)" --framework "net${_dotnet_version}" --runtime "${_platform}" \
                    -p:EnableWindowsTargeting=true
                ;;
        esac
    done
}
package(){
    depends+=(
        'libcap' 'nss' 'bash' 'hicolor-icon-theme'
        # Steam++.Accelerator
        'gcc-libs'
    )

    _platform="$(< _platform)"
    cd "${srcdir}/SteamTools"
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
    cp -av "${srcdir}/SteamTools/src/BD.WTTS.Client.Avalonia.App/bin/Release/net$_dotnet_version/$_platform/publish" \
        "${pkgdir}/usr/lib/watt-toolkit"
    for _id in "${!_plugins[@]}"
    do
        echo "Installing plugin ${_id}..."
        case "${_id}" in
            "BD.WTTS.Client.Plugins.Accelerator.ReverseProxy")
                install -Dvm755 "${srcdir}/SteamTools/src/${_id}/bin/Release/net${_dotnet_version}/${_platform}/publish/Steam++.Accelerator" \
                    "${pkgdir}/usr/lib/watt-toolkit/modules/${_plugins[${_id%.*}]}/Steam++.Accelerator"
                install -Dvm644 "${srcdir}/SteamTools/src/${_id}/bin/Release/net${_dotnet_version}/${_platform}/publish/libe_sqlite3.so" \
                    "${pkgdir}/usr/lib/watt-toolkit/modules/${_plugins[${_id%.*}]}/libe_sqlite3.so"
                ;;
            *)
                install -Dvm644 -t "${pkgdir}/usr/lib/watt-toolkit/modules/${_plugins[$_id]}" \
                    "${srcdir}/SteamTools/src/${_id}/bin/Release/net${_dotnet_version}/${_platform}/publish/${_id}".*
                ;;
        esac
    done
    echo "Installing misc files..."
    # See ./src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj#L8
    local -r appid=net.steampp.app
    for width in 16 24 32 48 64 96 128 256 512
    do
        echo "Processing ${width}x${width} icon..."
        install -Dvm644 \
            "./res/icons/app/v3/Logo_${width}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps/${appid}.png"
    done
    install -Dvm644 "./res/icons/app/v3/Icon_Logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${appid}.svg"
    install -Dvm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/${appid}.desktop"
    install -Dvm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
    install -Dvm755 "${srcdir}/environment_check.sh" "${pkgdir}/usr/lib/watt-toolkit/script/environment_check.sh"
    ln -sf /usr/lib/watt-toolkit/Steam++ "${pkgdir}/usr/bin/watt-toolkit"
    echo "Stripping binaries..."
    find "${pkgdir}/usr/lib/watt-toolkit" -type f -name '*.so' -printf "Stripping shared object %f...\n" \
        -exec strip $STRIP_SHARED {} \;
    # Fix https://github.com/BeyondDimension/SteamTools/issues/3403
    ln -srfv "${pkgdir}/usr/lib/watt-toolkit/Steam++" "${pkgdir}/usr/lib/watt-toolkit/Steam++.sh"
}
